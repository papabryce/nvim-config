-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
	require('custom.plugins.obsidian'),
	require('custom.plugins.notify'),
	require('custom.plugins.file_tree'),
	require('custom.plugins.noice'),
	require('custom.plugins.start_screen'),
	require('custom.plugins.tab_line'),
	{ "ellisonleao/glow.nvim", config = true, cmd = "Glow" },
	{
		'folke/todo-comments.nvim',
		dependencies = { "nvim-lua/plenary.nvim" },
		lazy = false,
		config = function()
			local todo = require('todo-comments')
			todo.setup()
		end
	},
	{
		"danilamihailov/beacon.nvim",
		event = "InsertEnter",
	},
	{
		"danymat/neogen",
		config = function()
			local ng = require('neogen')
			ng.setup({ snippet_engine = "luasnip" })

			vim.keymap.set('n', '<leader>dc', ng.generate,
				{ desc = '[D]ocument [C]ode' })
		end,
		-- Uncomment next line if you want to follow only stable versions
		-- version = "*"
	},
	{
		"zbirenbaum/copilot.lua",
		dependencies = {
			"zbirenbaum/copilot-cmp"
		},
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				suggestion = { enabled = false },
				panel = { enabled = false },
			})
			require("copilot_cmp").setup()
		end
	},
	{
		"luckasRanarison/tree-sitter-hyprlang"
	},
}
