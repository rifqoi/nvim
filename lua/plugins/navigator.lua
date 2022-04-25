require'navigator'.setup({
  on_attach = function(client, bufnr)
		client.resolved_capabilities.document_formatting = false
		client.resolved_capabilities.document_range_formatting = false
  end,
  lsp = {
	  format_on_save = true,
	  disable_format_cap = {"sqls", "gopls", "tsserver", "html", "pyright"},
  },
})

vim.cmd("hi default GHListDark guifg=#e0d8f4 guibg=none")
vim.cmd("hi default GHTextViewDark guifg=#e0d8f4 guibg=none")
vim.cmd("hi default GHListHl guibg=#4c5159")
