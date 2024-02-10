return {
  'jakewvincent/mkdnflow.nvim',
  config = function()
    require('mkdnflow').setup({
      mappings = {
        MkdnToggleToDo = { { 'n', 'v' }, '<leader>mt' },
        MkdnIncreaseHeading = { 'n', '<leader>mhd' },
        MkdnDecreaseHeading = { 'n', '<leader>mhi' },
        MkdnCreateLinkFromClipboard = { { 'n', 'v' }, '<leader>mp' },
      }

    })
  end
}
