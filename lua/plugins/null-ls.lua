-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ───────────────────────────────────────────────── --
--   Plugin:    null-ls.nvim
--   Github:    github.com/jose-elias-alvarez/null-ls.nvim
-- ───────────────────────────────────────────────── --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━❰ configs ❱━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md
local builtins = require("null-ls.builtins")
local formatting = builtins.formatting
-- local completion = builtins.completion
-- local diagnostics = builtins.diagnostics
-- local code_actions = builtins.code_actions

-- register any number of sources simultaneously
local sources = {}
local load = false

-- ───────────────────────────────────────────────── --
-- ─────────────────❰ FORMATTING ❱────────────────── --
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting

-- Lua
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

-- Sql
-- if vim.fn.executable("sqlfluff") == 1 then
-- 	load = true
-- 	sources[#sources + 1] = formatting.sqlfluff.with({
-- 		extra_args = {"--dialect", "postgres"}, -- change to your dialect

-- 	})
-- end
-- Go
--

local filetype = vim.bo.filetype

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

-- "javascript", "javascriptreact", "typescript", "typescriptreact", "vue",
-- "css", "scss", "less", "html", "json", "yaml", "markdown", "graphql"
if vim.fn.executable("prettierd") == 1 then
	load = true
	sources[#sources + 1] = formatting.prettierd
end
-- if vim.fn.executable("prettier") == 1 then
-- 	load = true
-- 	sources[#sources + 1] = formatting.prettier.with({
-- 		filetypes = {
-- 			"tmpl",
-- 			"javascript",
-- 			"javascriptreact",
-- 			"typescript",
-- 			"typescriptreact",
-- 			"vue",
-- 			"css",
-- 			"scss",
-- 			"less",
-- 			"json",
-- 			"jsonc",
-- 			"yaml",
-- 			"markdown",
-- 			"graphql",
-- 			"handlebars",
-- 		},
-- 		command = "prettier",
-- 		args = {"--stdin-filepath", "$FILENAME"},
-- 	})
-- end

-- Python
-- if vim.fn.executable("black") == 1 then
-- 	load = true
-- 	sources[#sources + 1] = formatting.black.with({
-- 		command = "black",
-- 		args = {"--quiet", "--fast", "-"},
-- 	})
-- end

if vim.fn.executable("yapf") == 1 then
	load = true
	sources[#sources + 1] = formatting.yapf
end

-- Django ("htmldjango")
if vim.fn.executable("djlint") == 1 then
	load = true
	sources[#sources + 1] = formatting.djlint.with({
		command = "djlint",
		args = {"--reformat", "-"},
	})
end

-- ───────────────❰ end FORMATTING ❱──────────────── --
-- ───────────────────────────────────────────────── --

-- ───────────────────────────────────────────────── --
-- ─────────────────❰ CODEACTION ❱────────────────── --
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/code_actions

--[===[
-- Javascript
if vim.fn.executable("clang-format") == 1 then
	load = true
	sources[#sources+1] = code_actions.eslint.with({
		command = "eslint",
		filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue" },
		args = { "-f", "json", "--stdin", "--stdin-filename", "$FILENAME" },
		to_stdin = true,
	})
end
---]===]

-- ───────────────❰ end CODEACTION ❱──────────────── --
-- ───────────────────────────────────────────────── --

-- ───────────────────────────────────────────────── --
-- ─────────────────❰ DIAGNOSTICS ❱───────────────── --
-- -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
-- -- Django ("htmldjango")
-- if vim.fn.executable("djlint") == 1 then
-- 	load = true
-- 	sources[#sources+1] = diagnostics.djlint.with({
-- 		command = "djlint",
-- 		args = { "$FILENAME" },
-- 	})
-- end
-- ───────────────❰ end DIAGNOSTICS ❱─────────────── --
-- ───────────────────────────────────────────────── --

-- ───────────────────────────────────────────────── --
-- ─────────────────❰ COMPLETION ❱────────────────── --
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/completion
-- ───────────────❰ end COMPLETION ❱──────────────── --
-- ───────────────────────────────────────────────── --

-- ───────────────────────────────────────────────── --
-- ───────────────────❰ HOVER ❱───────────────────── --
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/hover
-- ─────────────────❰ end HOVER ❱─────────────────── --
-- ───────────────────────────────────────────────── --

local lsp_formatting = function(bufnr)
    vim.lsp.buf.format({
        filter = function(client)
            -- apply whatever logic you want (in this example, we'll only use null-ls)
            return client.name == "null-ls"
        end,
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

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━❰ end configs ❱━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━❰ Mappings ❱━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --

local keymap = vim.api.nvim_set_keymap
keymap("n", "<Space>fm", "<ESC>:lua vim.lsp.buf.formatting()<CR>",
       {noremap = true, silent = true})

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━❰ end Mappings ❱━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
