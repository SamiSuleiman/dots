return {
  'akinsho/bufferline.nvim',
  enabled = false,
  version = '*',
  opts = {},
  config = function()
    require('bufferline').setup {
      -- options = {
      --   custom_areas = {
      --     right = function()
      --       local info = require('fuse').fuse()
      --       local result = {}
      --       if info ~= nil then
      --         table.insert(result, { text = '  ' .. info, bg = '#191724' })
      --       end
      --       return result
      --     end,
      -- },
      -- },
    }
  end,
}
