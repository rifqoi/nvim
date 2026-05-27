return {
	-- { "shaunsingh/oxocarbon.nvim" },
	-- { "ellisonleao/gruvbox.nvim" },
	-- {
	-- 	"luisiacc/gruvbox-baby",
	-- 	branch = "main",
	--
	-- 	init = function()
	-- 		-- Load the colorscheme here.
	-- 		-- vim.g.gruvbox_baby_background_color = "dark"
	-- 		-- vim.cmd.colorscheme("gruvbox-baby")
	--
	-- 		-- -- You can configure highlights by doing something like:
	-- 		-- vim.cmd.hi("Comment gui=none")
	-- 	end,
	-- },
	-- {
	-- 	"catppuccin/nvim",
	-- 	name = "catppuccin",
	-- 	-- init = function()
	-- 	-- 	vim.cmd.colorscheme("catppuccin")
	-- 	-- end,
	-- 	opts = {
	-- 		flavour = "mocha", -- latte, frappe, macchiato, mocha
	-- 		background = { -- :h background
	-- 			light = "latte",
	-- 			dark = "mocha",
	-- 		},
	-- 		compile_path = vim.fn.stdpath("cache") .. "/catppuccin",
	-- 		-- transparent_background = true,
	-- 		term_colors = true,
	-- 		dim_inactive = { enabled = true, shade = "dark", percentage = 0.15 },
	-- 		styles = {
	-- 			comments = { "italic" },
	-- 			conditionals = { "italic" },
	-- 			loops = {},
	-- 			functions = {},
	-- 			keywords = {},
	-- 			strings = {},
	-- 			variables = {},
	-- 			numbers = {},
	-- 			booleans = {},
	-- 			properties = {},
	-- 			types = {},
	-- 			operators = {},
	-- 		},
	-- 		color_overrides = {},
	-- 		custom_highlights = {},
	-- 		integrations = {
	-- 			cmp = true,
	-- 			gitsigns = true,
	-- 			nvimtree = { enabled = true, show_root = false, transparent_panel = true },
	-- 			telescope = true,
	-- 			native_lsp = {
	-- 				enabled = true,
	-- 				virtual_text = {
	-- 					errors = { "italic" },
	-- 					hints = { "italic" },
	-- 					warnings = { "italic" },
	-- 					information = { "italic" },
	-- 				},
	-- 				underlines = {
	-- 					errors = { "underline" },
	-- 					hints = { "underline" },
	-- 					warnings = { "underline" },
	-- 					information = { "underline" },
	-- 				},
	-- 			},
	-- 			indent_blankline = { enabled = true, colored_indent_levels = false },
	-- 			treesitter = true,
	-- 			ts_rainbow = true,
	-- 			-- beacon = true,
	-- 			fidget = true,
	-- 			-- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
	-- 		},
	-- 	},
	-- },

	-- { "rose-pine/neovim", name = "rose-pine" },
	-- {
	-- 	"folke/tokyonight.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	opts = function()
	-- 		return {
	-- 			style = "night",
	-- 			-- sidebars = {
	-- 			-- 	"qf",
	-- 			-- 	"vista_kind",
	-- 			-- 	"terminal",
	-- 			-- 	"spectre_panel",
	-- 			-- 	"startuptime",
	-- 			-- 	"Outline",
	-- 			-- },
	-- 			on_highlights = function(hl, c)
	-- 				hl.CursorLineNr = { fg = c.orange, bold = true }
	-- 				hl.LineNr = { fg = c.orange, bold = true }
	-- 				hl.LineNrAbove = { fg = c.fg_gutter }
	-- 				hl.LineNrBelow = { fg = c.fg_gutter }
	-- 				local prompt = "#2d3149"
	-- 				hl.TelescopeNormal = { bg = c.bg_dark, fg = c.fg_dark }
	-- 				hl.TelescopeBorder = { bg = c.bg_dark, fg = c.bg_dark }
	-- 				hl.TelescopePromptNormal = { bg = prompt }
	-- 				hl.TelescopePromptBorder = { bg = prompt, fg = prompt }
	-- 				hl.TelescopePromptTitle = { bg = c.fg_gutter, fg = c.orange }
	-- 				hl.TelescopePreviewTitle = { bg = c.bg_dark, fg = c.bg_dark }
	-- 				hl.TelescopeResultsTitle = { bg = c.bg_dark, fg = c.bg_dark }
	-- 			end,
	-- 		}
	-- 	end,
	-- },
	-- {
	-- 	"mcauley-penney/ice-cave.nvim",
	-- 	init = function()
	-- 		vim.cmd.colorscheme("ice-cave")
	-- 	end,
	-- 	-- config = function()
	-- 	-- 	vim.cmd.colorscheme("ice-cave")
	-- 	-- end,
	-- 	priority = 1000,
	-- },
	-- {
	-- 	"zenbones-theme/zenbones.nvim",
	-- 	-- Optionally install Lush. Allows for more configuration or extending the colorscheme
	-- 	-- If you don't want to install lush, make sure to set g:zenbones_compat = 1
	-- 	-- In Vim, compat mode is turned on as Lush only works in Neovim.
	-- 	init = function()
	-- 		vim.cmd.colorscheme("kanagawabones")
	-- 	end,
	-- 	dependencies = "rktjmp/lush.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	-- you can set set configuration options here
	-- 	-- config = function()
	-- 	--     vim.g.zenbones_darken_comments = 45
	-- 	--     vim.cmd.colorscheme('zenbones')
	-- 	-- end
	-- },
	{
		"rebelot/kanagawa.nvim",
		init = function()
			vim.cmd.colorscheme("kanagawa")
		end,
		config = function()
			require("kanagawa").setup({
				compile = false, -- enable compiling the colorscheme
				undercurl = true, -- enable undercurls
				commentStyle = { italic = false },
				functionStyle = {},
				keywordStyle = { italic = false },
				statementStyle = { bold = true },
				typeStyle = {},
				transparent = false, -- do not set background color
				dimInactive = false, -- dim inactive window `:h hl-NormalNC`
				terminalColors = true, -- define vim.g.terminal_color_{0,17}
				colors = { -- add/modify theme and palette colors
					palette = {},
					theme = {
						wave = {},
						lotus = {},
						dragon = {
							ui = {
								nontext = "#C8C093",
							},
						},
						all = {},
					},
				},
				overrides = function(colors) -- add/modify highlights
					local theme = colors.theme
					return {
						CursorLineNr = { fg = "#C8C093", bold = true },
						NormalFloat = { bg = "none" },
						FloatBorder = { bg = "none" },
						FloatTitle = { bg = "none" },

						-- Save an hlgroup with dark background and dimmed foreground
						-- so that you can use it where your still want darker windows.
						-- E.g.: autocmd TermOpen * setlocal winhighlight=Normal:NormalDark
						NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },

						-- Popular plugins that open floats will link to NormalFloat by default;
						-- set their background accordingly if you wish to keep them dark and borderless
						LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
						MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
					}
				end,
				theme = "dragon", -- Load "wave" theme
				background = { -- map the value of 'background' option to a theme
					dark = "dragon", -- try "dragon" !
					light = "lotus",
				},
			})
		end,
	},
}
