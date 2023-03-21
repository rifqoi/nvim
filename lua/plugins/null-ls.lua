local builtins = require("null-ls.builtins")
local formatting = builtins.formatting
-- local completion = builtins.completion
local diagnostics = builtins.diagnostics
local code_actions = builtins.code_actions

-- register any number of sources simultaneously
local sources = {}
local load = false

if vim.fn.executable("lua-format") == 1 then
	load = true
	sources[#sources + 1] = formatting.lua_format.with({
		command = "lua-format",
		args = {
			"--indent-width",
			"1",
			"--tab-width",
			"4",
			"--use-tab",
			"--chop-down-table",
			"--extra-sep-at-table-end",
		},
	})
end

if vim.fn.executable("gofmt") == 1 then
	load = true
	sources[#sources + 1] = formatting.gofmt.with({to_stdin = true})
end

-- C, C++, CS, Java
if vim.fn.executable("clang-format") == 1 then
	load = true
	sources[#sources + 1] = formatting.clang_format.with({
		command = "clang-format",
		args = {
			"-assume-filename",
			"$FILENAME",
			"-style",
			"{BasedOnStyle: Microsoft, UseTab: Always}",
		},
		to_stdin = true,
	})
end

if vim.fn.executable("prettierd") == 1 then
	load = true
	sources[#sources + 1] = formatting.prettierd
end

-- Python
if vim.fn.executable("black") == 1 then
	load = true
	sources[#sources + 1] = formatting.black.with({
		command = "black",
		args = {"--quiet", "--fast", "-"},
	})
end

-- if vim.fn.executable("yapf") == 1 then
-- 	load = true
-- 	sources[#sources + 1] = formatting.yapf
-- end

if vim.fn.executable("eslint_d") == 1 then
	load = true
	sources[#sources + 1] = diagnostics.eslint_d.with({
		diagnostics_format = '[eslint] #{m}\n(#{c})',
	})
	sources[#sources + 1] = code_actions.eslint_d
end

local lsp_formatting = function(bufnr)
	vim.lsp.buf.format({
		-- filter = function(client)
		-- 	-- apply whatever logic you want (in this example, we'll only use null-ls)
		-- 	return client.name == "null-ls"
		-- end,
		bufnr = bufnr,
	})
end

-- if you want to set up formatting on save, you can use this as a callback
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

-- add to your shared on_attach callback
local on_attach = function(client, bufnr)
	if client.supports_method("textDocument/formatting") then
		vim.api.nvim_clear_autocmds({group = augroup, buffer = bufnr})
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = augroup,
			buffer = bufnr,
			callback = function() lsp_formatting(bufnr) end,
		})
	end
end

if load then require("null-ls").setup({sources = sources, on_attach = on_attach}) end

if vim.bo.filetype == "html" then
	package.loaded['null-ls'] = nil
	_G['null-ls'] = nil
end

local keymap = vim.api.nvim_set_keymap
keymap("n", "<Space>fm", "<ESC>:lua vim.lsp.buf.format{async=true}<CR>",
       {noremap = true, silent = true})
