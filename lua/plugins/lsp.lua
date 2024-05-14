-- NOTE: This is where your plugins related to LSP can be installed.
return {
  --  The configuration is done below. Search for lspconfig to find it below.
  {
    -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    lazy = true,
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      -- 'mfussenegger/nvim-lint',
      -- 'rshkarin/mason-nvim-lint',
      -- Additional lua configuration, makes nvim stuff amazing!
      'folke/neodev.nvim',
    },
    opts = {
      inlay_hints = { enabled = true }
    }
  },

  {
    -- Autocompletion
    'hrsh7th/nvim-cmp',
    lazy = true,
    dependencies = {
      -- Snippet Engine & its associated nvim-cmp source
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',

      -- Adds LSP completion capabilities
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',

      -- Adds a number of user-friendly snippets
      'rafamadriz/friendly-snippets',
    },
  },
  config = function()

  end,
}
