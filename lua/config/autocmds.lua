-- Autocommand functions
-- See also: h:api-autocmd, h:augroup

local function augroup(name)
	return vim.api.nvim_create_augroup("core_custom_" .. name, { clear = true })
end
-- Set filetype to helm when the file is in certain paths
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
	group = augroup("set_filetype_of_helm"),
	pattern = { "*/templates/*.yaml", "*/templates/*.tpl", "*.gotmpl", "helmfile*.yaml" },
	callback = function()
		vim.opt_local.filetype = "helm"
	end,
})
