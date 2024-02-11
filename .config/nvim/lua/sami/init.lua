if not vim.g.vscode then
	require('sami.plugins')
	require('sami.configs')
	require('sami.settings')
	require('sami.keymaps')
else
	require('sami.codium')
end
