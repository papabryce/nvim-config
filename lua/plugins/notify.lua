return {
	{
		"rcarriga/nvim-notify",
		config = function()
			require("notify").setup({
				background_colour = "#000000",
				--[[ render = "compact", ]]
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
