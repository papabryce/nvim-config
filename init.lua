-- Set <space> as the leader key:
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.wo.relativenumber = true
vim.opt.conceallevel = 1

require('lazy-bootstrap')

require('lazy').setup({
  { import = 'plugins' },
}, {})

require('options')

require('lsp-cfg')

require('keymaps').basic()

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
