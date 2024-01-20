-- -- Unless you are still migrating, remove the deprecated commands from v1.x
-- vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
--
-- return {
-- 	"nvim-neo-tree/neo-tree.nvim",
-- 	version = "*",
-- 	dependencies = {
-- 		"nvim-lua/plenary.nvim",
-- 		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
-- 		"MunifTanjim/nui.nvim",
-- 		"3rd/image.nvim",
-- 	},
-- 	config = function()
-- 		require('neo-tree').setup {}
-- 		vim.keymap.set('n', '<C-n>', '<cmd>Neotree toggle<CR>', { desc = '[F]iletree [T]oggle' })
-- 	end,
-- }
--
return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local setup, nvimtree = pcall(require, "nvim-tree")
		if not setup then return end

		vim.cmd([[
  nnoremap - :NvimTreeToggle<CR>
]])

		-- local keymap = vim.keymap -- for conciseness
		-- keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>") -- toggle file explorer

		-- vim.opt.foldmethod = "expr"
		-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
		-- vim.opt.foldenable = false --                  " Disable folding at startup.

		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		vim.opt.termguicolors = true

		local HEIGHT_RATIO = 0.8 -- You can change this
		local WIDTH_RATIO = 0.5 -- You can change this too

		nvimtree.setup({
			disable_netrw = true,
			hijack_netrw = true,
			respect_buf_cwd = true,
			sync_root_with_cwd = true,
			view = {
				relativenumber = true,
				float = {
					enable = true,
					open_win_config = function()
						local screen_w = vim.opt.columns:get()
						local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
						local window_w = screen_w * WIDTH_RATIO
						local window_h = screen_h * HEIGHT_RATIO
						local window_w_int = math.floor(window_w)
						local window_h_int = math.floor(window_h)
						local center_x = (screen_w - window_w) / 2
						local center_y = ((vim.opt.lines:get() - window_h) / 2)
						    - vim.opt.cmdheight:get()
						return {
							border = "rounded",
							relative = "editor",
							row = center_y,
							col = center_x,
							width = window_w_int,
							height = window_h_int,
						}
					end,
				},
				width = function()
					return math.floor(vim.opt.columns:get() * WIDTH_RATIO)
				end,
			},
			-- filters = {
			--   custom = { "^.git$" },
			-- },
			-- renderer = {
			--   indent_width = 1,
			-- },
		})
		vim.keymap.set('n', '<C-n>', '<cmd>NvimTreeToggle<CR>', { desc = 'Toggle Filetree' })
	end,
}
