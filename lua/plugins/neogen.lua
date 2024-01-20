return {
  "danymat/neogen",
  config = function()
    local ng = require('neogen')
    ng.setup({ snippet_engine = "luasnip" })

    vim.keymap.set('n', '<leader>dc', ng.generate,
      { desc = '[D]ocument [C]ode' })
  end,
  -- Uncomment next line if you want to follow only stable versions
  -- version = "*"
}
