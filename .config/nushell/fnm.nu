# Export environment variable settings
export-env {
    # Define a function to get fnm environment variable settings
    def fnm-env [] {
        # Create a mutable empty record to store environment variables
        mut env_vars = {}
        
        # Get fnm environment variable settings under PowerShell
        # Parse the output into key-value pairs through pipeline processing
        let pwsh_vars = (
            ^fnm env --shell powershell | 
            lines | 
            parse "$env:{key} = \"{value}\""
        )

        # Process fnm-related environment variables
        # Iterate through all variables except the first element (PATH) and add them to env_vars
        for v in ($pwsh_vars | slice 1..) { 
            $env_vars = ($env_vars | insert $v.key $v.value) 
        }

        # Special handling for PATH environment variable
        # Get the actual PATH variable name used in the current environment (considering case sensitivity)
        let env_used_path = ($env | columns | where {str downcase | $in == "path"} | get 0)
        # Get and split PATH value into array
        let path_value = ($pwsh_vars | get 0.value | split row (char esep))
        # Add the processed PATH to the environment variable collection
        $env_vars = ($env_vars | insert $env_used_path $path_value)

        return $env_vars
    }

    # Check if fnm command exists
    if not (which fnm | is-empty) {
        # Load fnm environment variables
        fnm-env | load-env

        # Set directory change hook (only set once)
        if (not ($env | default false __fnm_hooked | get __fnm_hooked)) {
            # Mark hook as set
            $env.__fnm_hooked = true
            
            # Initialize configuration structure
            $env.config = ($env | default {} config).config
            $env.config = ($env.config | default {} hooks)
            $env.config = ($env.config | update hooks ($env.config.hooks | default {} env_change))
            $env.config = ($env.config | update hooks.env_change ($env.config.hooks.env_change | default [] PWD))
            
            # Add directory change handler function
            # When .nvmrc or .node-version file exists in the directory
            # Automatically switch to the corresponding Node.js version
            $env.config = ($env.config | update hooks.env_change.PWD ($env.config.hooks.env_change.PWD | append { |before, after|
                if ('FNM_DIR' in $env) and ([.nvmrc .node-version] | path exists | any { |it| $it }) {
                    (fnm-env | load-env); (^fnm use)
                }
            }))
        }
    }
}
