local vim = vim
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
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local luasnip = require("luasnip")
local lspkind = require("lspkind")
cmp.setup({
	snippet = {
		expand = function(args)
			-- For `vsnip` user.
			-- vim.fn["vsnip#anonymous"](args.body)

			-- For `luasnip` user.
			require("luasnip").lsp_expand(args.body)

			-- For `ultisnips` user.
			-- vim.fn["UltiSnips#Anon"](args.body)
		end,
	},
	mapping = {
		["<C-u>"] = cmp.mapping.scroll_docs(-4),
		["<C-d>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		-- ["<Tab>"] = cmp.mapping.select_next_item(),
		-- ["<S-Tab>"] = cmp.mapping.select_prev_item(),
		["<C-e>"] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),
		["<CR>"] = cmp.mapping.confirm({ select = false }),
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
		end, { "i", "s" }),

		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
	},

	formatting = {
		format = function(entry, vim_item)
			vim_item.kind = lspkind.presets.default[vim_item.kind]
			local menu = source_mapping[entry.source.name]
			-- if entry.source.name == "cmp_tabnine" then
			-- 	if entry.completion_item.data ~= nil and entry.completion_item.data.detail ~= nil then
			-- 		menu = entry.completion_item.data.detail .. " " .. menu
			-- 	end
			-- 	vim_item.kind = ""
			-- end
			vim_item.menu = menu
			return vim_item
		end,
	},

	sources = {
		-- tabnine completion? yayaya
		{ name = "nvim_lsp" },
		-- { name = "cmp_tabnine" },
		-- { name = 'vsnip' },
		{ name = "luasnip" },
		-- { name = 'ultisnips' },
		{ name = "buffer" },
		{ name = "path" },
		{ name = "nvim_lsp_signature_help" },
	},
})

--local protocol = require("vim.lsp.protocol")
--protocol.CompletionItemKind = {
--	"", -- Text
--	"", -- Method
--	"", -- Function
--	"", -- Constructor
--	"", -- Field
--	"", -- Variable
--	"", -- Class
--	"ﰮ", -- Interface
--	"", -- Module
--	"", -- Property
--	"", -- Unit
--	"", -- Value
--	"", -- Enum
--	"", -- Keyword
--	"﬌", -- Snippet
--	"", -- Color
--	"", -- File
--	"", -- Reference
--	"", -- Folder
--	"", -- EnumMember
--	"", -- Constant
--	"", -- Struct
--	"", -- Event
--	"ﬦ", -- Operator
--	"", -- TypeParameter
--}

--local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
--for type, icon in pairs(signs) do
--	local hl = "DiagnosticSign" .. type
--	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
--end

--local opts = { noremap = true, silent = true }
--vim.api.nvim_set_keymap("n", "<space>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
--vim.api.nvim_set_keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
--vim.api.nvim_set_keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
--vim.api.nvim_set_keymap("n", "<space>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)

---- Use an on_attach function to only map the following keys
---- after the language server attaches to the current buffer
--local on_attach = function(client, bufnr)
--	-- Enable completion triggered by <c-x><c-o>
--	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
--	-- Mappings.
--	-- See `:help vim.lsp.*` for documentation on any of the below functions
--	vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
--	-- vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
--	vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", ":Telescope lsp_definitions<CR>", opts)
--	vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
--	vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
--	vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
--	vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
--	vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
--	vim.api.nvim_buf_set_keymap(
--		bufnr,
--		"n",
--		"<space>wl",
--		"<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>",
--		opts
--	)
--	vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
--	vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
--	vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>ca", ":Telescope lsp_code_actions<CR>", opts)
--	-- vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
--	vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", ":Telescope lsp_references<CR>", opts)
--	--nnoremap({"gr"}, ":Telescope lsp_references<CR>", "silent")
--	vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
--end

--local runtime_path = vim.split(package.path, ";")
--table.insert(runtime_path, "lua/?.lua")
--table.insert(runtime_path, "lua/?/init.lua")
--local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
---- Use a loop to conveniently call 'setup' on multiple servers and
---- map buffer local keybindings when the language server attaches
---- vim.cmd("autocmd BufNewFile,BufRead *.cshtml set syntax=html")

vim.cmd("autocmd BufNewFile,BufRead *.tmpl setf html")
--local servers = { "pyright", "sumneko_lua", "gopls", "tsserver", "html", "tailwindcss" }
--for _, lsp in pairs(servers) do
--	require("lspconfig")[lsp].setup({
--		on_attach = on_attach,
--		capabilities = capabilities,
--		flags = {
--			-- This will be the default in neovim 0.7+
--			debounce_text_changes = 150,
--		},
--	})
--end
require'navigator'.setup({
  on_attach = function(client, bufnr)
		client.resolved_capabilities.document_formatting = false
		client.resolved_capabilities.document_range_formatting = false
  end,
  lsp = {
	  format_on_save = false,
	  disable_format_cap = {"sqls", "gopls", "tsserver"},  -- a list of lsp disable format capacity (e.g. if you using efm or vim-codeformat etc), empty {} by default

  },
})

vim.cmd("hi default GHListDark guifg=#e0d8f4 guibg=none")
vim.cmd("hi default GHTextViewDark guifg=#e0d8f4 guibg=none")
vim.cmd("hi default GHListHl guibg=#4c5159")


require("luasnip.loaders.from_vscode").load()
