-- Set <space> as the leader key:
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.wo.relativenumber = true
vim.opt.conceallevel = 1

if vim.g.vscode then
  -- VSCode extension
else
  -- ordinary Neovim
  require('lazy-bootstrap')

  require('lazy').setup({
    { import = 'plugin-manifest' },
  }, {
    defaults = {
      --  lazy = true
    }
  })
  require('options')
  require('lsp-cfg')
  require('keymaps').map_basic()
end

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
