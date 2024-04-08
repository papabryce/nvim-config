return {
  "jbyuki/nabla.nvim",
  ft = { 'markdown', 'latex' },
  config = function()
    require('keymaps').map_naba()
  end
}
