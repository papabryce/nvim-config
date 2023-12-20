return {
	'akinsho/bufferline.nvim',
	version = "*",
	dependencies = 'nvim-tree/nvim-web-devicons',
	config = function()
		local b = require("bufferline")
		b.setup()
		vim.keymap.set('n', '<Tab>', function() b.cycle(1) end,
			{ desc = 'Move to next buffer on bufferline' })
		vim.keymap.set('n', '<S-Tab>', function() b.cycle(-1) end,
			{ desc = 'Move to previous buffer on bufferline' })
		vim.keymap.set('n', '<leader>x', '<cmd>:bdelete<CR>',
			{ desc = 'Close current buffer' })
	end
}
