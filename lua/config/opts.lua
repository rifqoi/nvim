vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font = true
vim.o.guicursor = "n-v-c-sm:block-blinkon100,i-ci-ve:ver25-blinkon100,r-cr-o:hor20"

--
-- function trim(s)
-- 	return (string.gsub(s, "^%s*(.-)%s*$", "%1"))
-- end
--
-- if vim.fn.has("macunix") then
-- 	local checkCharging =
-- 		"system_profiler SPPowerDataType | grep 'AC Charger Information' -A 4 | grep 'Charging' | awk '{ print $2 }'"
-- 	local handle = io.popen(checkCharging)
-- 	local result = handle:read("*a")
-- 	handle:close()
-- 	if not result then
-- 		return
-- 	end
--
-- 	result = trim(result)
-- 	if result ~= "No" then
-- 		vim.o.guicursor = "n-v-c-sm:block-blinkon100,i-ci-ve:ver25-blinkon100,r-cr-o:hor20"
-- 	end
--
-- else
-- 	os = "linux"
-- end

local opt = vim.opt

opt.number = true
opt.relativenumber = true
opt.concealcursor = "nc"

if vim.fn.executable("rg") == 1 then
	opt.grepprg = "rg --vimgrep"
end

opt.number = true
opt.relativenumber = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.expandtab = true
opt.completeopt = { "menu", "menuone", "noselect" }
opt.signcolumn = "yes:1"
opt.hidden = true
opt.mouse = "a"
opt.smartindent = true
opt.background = "dark"
opt.termguicolors = true
opt.cursorline = true
opt.laststatus = 0
-- opt.confirm = true -- Confirm to save changes before exiting modified buffer
opt.cursorline = true -- Enable highlighting of the current line
opt.formatoptions = "jcroqlnt" -- tcqj
opt.grepformat = "%f:%l:%c:%m"
opt.ignorecase = true -- Ignore case
opt.inccommand = "nosplit" -- preview incremental substitute
opt.mouse = "a" -- Enable mouse mode
opt.pumblend = 10 -- Popup blend
opt.pumheight = 10 -- Maximum number of entries in a popup
opt.scrolloff = 4 -- Lines of context
opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize" }
opt.shortmess:append({ W = true, I = true, c = true })
opt.showmode = false -- Dont show mode since we have a statusline
opt.sidescrolloff = 8 -- Columns of context
opt.smartcase = true -- Don't ignore case with capitals
opt.spelllang = { "en" }
opt.splitbelow = true -- Put new windows below current
opt.splitright = true -- Put new windows right of current
opt.termguicolors = true -- True color support
opt.timeoutlen = 300
opt.undofile = true
opt.undolevels = 10000
opt.updatetime = 200 -- Save swap file and trigger CursorHold
opt.wildmode = "longest:full,full" -- Command-line completion mode
