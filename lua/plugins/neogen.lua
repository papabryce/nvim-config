return {
  "danymat/neogen",
  config = function()
    local ng = require('neogen')
    ng.setup({ snippet_engine = "luasnip" })
    require('keymaps').neogen()
  end,
  -- Uncomment next line if you want to follow only stable versions
  -- version = "*"
}
