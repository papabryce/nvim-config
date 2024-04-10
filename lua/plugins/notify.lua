return {
	{
		"rcarriga/nvim-notify",
		config = function()
			require("notify").setup({
				background_colour = "#000000",
				-- render = "wrapped-compact",
				stages = "slide",
			})
		end
	},
	-- {
	-- 	"mrded/nvim-lsp-notify",
	-- 	dependencies = { "rcarriga/nvim-notify" },
	-- 	config = function()
	-- 		require('lsp-notify').setup({
	-- 			notify = require('notify'),
	-- 		})
	-- 	end
	--
	-- }-
}
