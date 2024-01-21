return {
	'akinsho/bufferline.nvim',
	version = "*",
	dependencies = 'nvim-tree/nvim-web-devicons',
	config = function()
		local b = require("bufferline")
		b.setup()
		require('keymaps').tabline()
	end
}
