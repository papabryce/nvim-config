return {
	'akinsho/bufferline.nvim',
	version = "*",
	dependencies = 'nvim-tree/nvim-web-devicons',
	lazy = true,
	config = function()
		local b = require("bufferline")
		b.setup()
		require('keymaps').map_tabline()
	end
}
