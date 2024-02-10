return {
  {
    "Equilibris/nx.nvim",

    commit       = 'aabfdbe356864a8674c12aec655e415962aceef5',
    dependencies = {
      "nvim-telescope/telescope.nvim",
    },

    opts         = {
      -- See below for config options
      nx_cmd_root = "npx nx",
    },

    -- Plugin will load when you use these keys
    keys         = {
      { "<leader>hn", "<cmd>Telescope nx actions<CR>", desc = "nx actions" }
    },
  },
}
