local lsp_formatter = {"sqls", "gopls", "tsserver", "pyright", "html"}

local util = require 'vim.lsp.util'

local formatting_callback = function(client, bufnr)
	vim.keymap.set('n', '<leader>fm', function()
		local params = util.make_formatting_params({})
		client.request('textDocument/formatting', params, nil, bufnr)
	end, {buffer = bufnr})
end

require'navigator'.setup({
	on_attach = function(client, bufnr)
		client.resolved_capabilities.document_formatting = false
		client.resolved_capabilities.document_range_formatting = false
		require"lsp_signature".on_attach()
	end,
	keymaps = {{key = "<C-p>", func = "signature_help()"}},
	lsp_signature_help = true,
	icons = {
		code_action_icon = '', -- "",
		-- code lens
		code_lens_action_icon = '👓',
		-- Diagnostics
		diagnostic_head = '',
		diagnostic_err = '✗',
		diagnostic_warn = '',
		diagnostic_info = [[]],
		diagnostic_hint = [[]],
		diagnostic_head_severity_1 = '🈲',
		diagnostic_head_severity_2 = '☣️',
		diagnostic_head_severity_3 = '👎',
		diagnostic_head_description = '👹',
		diagnostic_virtual_text = '',
		diagnostic_file = '',
	},
	lsp = {
		format_on_save = false,
		disable_format_cap = lsp_formatter,
		disable_lsp = {
			'pylsd',
			'sqlls',
			'angularls',
			'denols',
			'pylsp',
			'jedi_language_server',
		},
		html = {
			on_attach = function(client, bufnr) formatting_callback(client, bufnr) end,
		},
		gopls = {settings = {gopls = {usePlaceholders = false}}},
	},
})

vim.cmd("hi default GHListDark guifg=#e0d8f4 guibg=none")
vim.cmd("hi default GHTextViewDark guifg=#e0d8f4 guibg=none")
vim.cmd("hi default GHListHl guibg=#4c5159")
