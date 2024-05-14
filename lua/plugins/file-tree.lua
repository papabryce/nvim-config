return {
	"nvim-neo-tree/neo-tree.nvim",
	lazy = true,
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
		"3rd/image.nvim",            -- Optional image support in preview window: See `# Preview Mode` for more information
	},
	keys = {
		{
			"<C-n>",
			"<cmd> Neotree toggle <cr>",
			"Toggle filetree"
		}
	},

	config = function()
		require("neo-tree").setup({
			sources = { "filesystem", "buffers", "git_status", "document_symbols" },
			open_files_do_not_replace_types = { "terminal", "Trouble", "trouble", "qf", "Outline" },
			window = {
				position = "left",
				width = 40,
				mapping_options = {
					noremap = true,
					nowait = true,
				},
				mappings = {
					["<space>"] = {
						"toggle_node",
						nowait = false, -- disable `nowait` if you have existing combos starting with this char that you want to use
					},
					["<2-LeftMouse>"] = "open",
					["<cr>"] = "open",
					["<esc>"] = "cancel", -- close preview or floating neo-tree window
					["P"] = { "toggle_preview", config = { use_float = false, use_image_nvim = true } },
					-- Read `# Preview Mode` for more information
					["l"] = "focus_preview",
					["S"] = "open_split",
					["s"] = "open_vsplit",
					-- ["S"] = "split_with_window_picker",
					-- ["s"] = "vsplit_with_window_picker",
					["t"] = "open_tabnew",
					-- ["<cr>"] = "open_drop",
					-- ["t"] = "open_tab_drop",
					["w"] = "open_with_window_picker",
					--["P"] = "toggle_preview", -- enter preview mode, which shows the current node without focusing
					["C"] = "close_node",
					-- ['C'] = 'close_all_subnodes',
					["z"] = "close_all_nodes",
					--["Z"] = "expand_all_nodes",
					["a"] = {
						"add",
						-- this command supports BASH style brace expansion ("x{a,b,c}" -> xa,xb,xc). see `:h neo-tree-file-actions` for details
						-- some commands may take optional config options, see `:h neo-tree-mappings` for details
						config = {
							show_path = "none" -- "none", "relative", "absolute"
						}
					},
					["A"] = "add_directory", -- also accepts the optional config.show_path option like "add". this also supports BASH style brace expansion.
					["d"] = "delete",
					["r"] = "rename",
					["y"] = "copy_to_clipboard",
					["x"] = "cut_to_clipboard",
					["p"] = "paste_from_clipboard",
					["c"] = "copy", -- takes text input for destination, also accepts the optional config.show_path option like "add":
					-- ["c"] = {
					--  "copy",
					--  config = {
					--    show_path = "none" -- "none", "relative", "absolute"
					--  }
					--}
					["m"] = "move", -- takes text input for destination, also accepts the optional config.show_path option like "add".
					["q"] = "close_window",
					["R"] = "refresh",
					["?"] = "show_help",
					["<"] = "prev_source",
					[">"] = "next_source",
					["i"] = "show_file_details",
				}
			},
			default_component_configs = {
				indent = {
					with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
					expander_collapsed = "",
					expander_expanded = "",
					expander_highlight = "NeoTreeExpander",
				},
			},
		})
	end
}

-- return {
-- 	"nvim-tree/nvim-tree.lua",
-- 	version = "*",
-- 	lazy = true,
-- 	keys = {
-- 		-- vim.keymap.set('n', '<C-n>', '<cmd>NvimTreeToggle<CR>', { desc = 'Toggle Filetree' })
-- 		{ "<C-N>", "<cmd>NvimTreeToggle<CR>", desc = "Toggle Filetree" },
-- 	},
-- 	dependencies = {
-- 		"nvim-tree/nvim-web-devicons",
-- 	},
-- 	config = function()
-- 		local setup, nvimtree = pcall(require, "nvim-tree")
-- 		if not setup then return end
--
-- 		vim.cmd([[
--   nnoremap - :NvimTreeToggle<CR>
-- ]])
--
-- 		-- local keymap = vim.keymap -- for conciseness
-- 		-- keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>") -- toggle file explorer
--
-- 		-- vim.opt.foldmethod = "expr"
-- 		-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
-- 		-- vim.opt.foldenable = false --                  " Disable folding at startup.
--
-- 		vim.g.loaded_netrw = 1
-- 		vim.g.loaded_netrwPlugin = 1
--
-- 		vim.opt.termguicolors = true
--
-- 		local HEIGHT_RATIO = 0.8 -- You can change this
-- 		local WIDTH_RATIO = 0.5 -- You can change this too
--
-- 		nvimtree.setup({
-- 			disable_netrw = true,
-- 			hijack_netrw = true,
-- 			respect_buf_cwd = true,
-- 			sync_root_with_cwd = true,
-- 			view = {
-- 				relativenumber = true,
-- 				float = {
-- 					enable = true,
-- 					open_win_config = function()
-- 						local screen_w = vim.opt.columns:get()
-- 						local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
-- 						local window_w = screen_w * WIDTH_RATIO
-- 						local window_h = screen_h * HEIGHT_RATIO
-- 						local window_w_int = math.floor(window_w)
-- 						local window_h_int = math.floor(window_h)
-- 						local center_x = (screen_w - window_w) / 2
-- 						local center_y = ((vim.opt.lines:get() - window_h) / 2)
-- 								- vim.opt.cmdheight:get()
-- 						return {
-- 							border = "rounded",
-- 							relative = "editor",
-- 							row = center_y,
-- 							col = center_x,
-- 							width = window_w_int,
-- 							height = window_h_int,
-- 						}
-- 					end,
-- 				},
-- 				width = function()
-- 					return math.floor(vim.opt.columns:get() * WIDTH_RATIO)
-- 				end,
-- 			},
-- 			-- filters = {
-- 			--   custom = { "^.git$" },
-- 			-- },
-- 			-- renderer = {
-- 			--   indent_width = 1,
-- 			-- },
-- 		})
-- 	end,
-- }
