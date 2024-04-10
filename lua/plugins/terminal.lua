return {
  'CRAG666/betterTerm.nvim',
  config = function()
    require('betterTerm').setup()
    require('keymaps').map_better_term()
  end,
}
