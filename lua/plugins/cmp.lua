local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Setup nvim-cmp
local cmp = require("cmp")
local source_mapping = {
	buffer = "[Buffer]",
	nvim_lsp = "[LSP]",
	nvim_lua = "[Lua]",
	-- cmp_tabnine = "[TN]",
	path = "[Path]",
}
local has_words_before = function()
	table.unpack = table.unpack or unpack
	local line, col = table.unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and
					       vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col)
									       :match("%s") == nil
end

local t = function(str)
	return vim.api.nvim_replace_termcodes(str, true, true, true)
end
local luasnip = require("luasnip")
local lspkind = require("lspkind")

local icons = {
	Namespace = "",
	Text = " ",
	Method = " ",
	Function = " ",
	Constructor = " ",
	Field = "ﰠ ",
	Variable = " ",
	Class = "ﴯ ",
	Interface = " ",
	Module = " ",
	Property = "ﰠ ",
	Unit = "塞 ",
	Value = " ",
	Enum = " ",
	Keyword = " ",
	Snippet = " ",
	Color = " ",
	File = " ",
	Reference = " ",
	Folder = " ",
	EnumMember = " ",
	Constant = " ",
	Struct = "פּ ",
	Event = " ",
	Operator = " ",
	TypeParameter = " ",
	Table = "",
	Object = " ",
	Tag = "",
	Array = "[]",
	Boolean = " ",
	Number = " ",
	Null = "ﳠ",
	String = " ",
	Calendar = "",
	Watch = " ",
	Package = "",
}

local cmp_window = require "cmp.utils.window"

cmp_window.info_ = cmp_window.info
cmp_window.info = function(self)
	local info = self:info_()
	info.scrollable = false
	return info
end

local function border(hl_name)
	return {
		{"╭", hl_name},
		{"─", hl_name},
		{"╮", hl_name},
		{"│", hl_name},
		{"╯", hl_name},
		{"─", hl_name},
		{"╰", hl_name},
		{"│", hl_name},
	}
end

cmp.setup({
	window = {
		completion = {
			border = border "CmpBorder",
			winhighlight = "Normal:CmpPmenu,CursorLine:PmenuSel,Search:None",
		},
		documentation = {border = border "CmpDocBorder"},
	},
	snippet = {
		expand = function(args)
			-- For `luasnip` user.
			require("luasnip").lsp_expand(args.body)

		end,
	},
	mapping = {
		['<Down>'] = cmp.mapping(cmp.mapping.select_next_item({
			behavior = cmp.SelectBehavior.Select,
		}), {'i'}),
		['<Up>'] = cmp.mapping(cmp.mapping.select_prev_item({
			behavior = cmp.SelectBehavior.Select,
		}), {'i'}),
		['<C-n>'] = cmp.mapping({
			c = function()
				if cmp.visible() then
					cmp.select_next_item({behavior = cmp.SelectBehavior.Select})
				else
					vim.api.nvim_feedkeys(t('<Down>'), 'n', true)
				end
			end,
			i = function(fallback)
				if cmp.visible() then
					cmp.select_next_item({behavior = cmp.SelectBehavior.Select})
				else
					fallback()
				end
			end,
		}),
		['<C-p>'] = cmp.mapping({
			c = function()
				if cmp.visible() then
					cmp.select_prev_item({behavior = cmp.SelectBehavior.Select})
				else
					vim.api.nvim_feedkeys(t('<Up>'), 'n', true)
				end
			end,
			i = function(fallback)
				if cmp.visible() then
					cmp.select_prev_item({behavior = cmp.SelectBehavior.Select})
				else
					fallback()
				end
			end,
		}),
		['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), {'i', 'c'}),
		['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), {'i', 'c'}),
		['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), {'i', 'c'}),
		['<C-e>'] = cmp.mapping({i = cmp.mapping.close(), c = cmp.mapping.close()}),
		["<Tab>"] = cmp.mapping.select_next_item(),
		["<S-Tab>"] = cmp.mapping.select_prev_item(),
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			elseif has_words_before() then
				cmp.complete()
			else
				fallback()
			end
		end, {"i", "s"}),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, {"i", "s"}),
		-- ["<C-u>"] = cmp.mapping.scroll_docs(-4),
		-- ["<C-d>"] = cmp.mapping.scroll_docs(4),
		-- ["<C-Space>"] = cmp.mapping.complete(),
		-- ["<C-e>"] = cmp.mapping({i = cmp.mapping.abort(), c = cmp.mapping.close()}),
		["<CR>"] = cmp.mapping.confirm {
			behavior = cmp.ConfirmBehavior.Replace,
			select = false,
		},
		-- ["<CR>"] = cmp.mapping.confirm({select = false}),
	},

	formatting = {
		format = function(entry, vim_item)
			-- 	vim_item.kind = lspkind.presets.default[vim_item.kind]
			-- 	local menu = source_mapping[entry.source.name]
			-- 	-- if entry.source.name == "cmp_tabnine" then
			-- 	-- 	if entry.completion_item.data ~= nil and entry.completion_item.data.detail ~= nil then
			-- 	-- 		menu = entry.completion_item.data.detail .. " " .. menu
			-- 	-- 	end
			-- 	-- 	vim_item.kind = ""
			-- 	-- end
			-- 	vim_item.menu = menu
			-- 	return vim_item
			-- local icons = require("ui.icons").lspkind
			vim_item.kind = string.format("%s %s", icons[vim_item.kind], vim_item.kind)
			return vim_item
		end,
	},

	sources = {
		-- tabnine completion? yayaya
		{name = "nvim_lsp"},
		-- { name = "cmp_tabnine" },
		-- { name = 'vsnip' },
		{name = "luasnip"},
		-- { name = 'ultisnips' },
		{name = "buffer"},
		{name = "path"},
		{name = "nvim_lsp_signature_help"},
	},
})

require("luasnip.loaders.from_vscode").load()

-- local signature_config = {
-- 	log_path = vim.fn.expand("$HOME") .. "/tmp/sig.log",
-- 	debug = true,
-- 	hint_enable = false,
-- 	handler_opts = {border = "single"},
-- 	max_width = 80,
-- }

-- require("lsp_signature").setup(signature_config)
