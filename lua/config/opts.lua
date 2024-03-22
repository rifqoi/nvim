local vim = vim
local set = vim.opt

set.number = true
set.relativenumber = true
set.shiftwidth = 4
set.tabstop = 4
set.expandtab = true
set.completeopt = { "menu", "menuone", "noselect" }
set.signcolumn = "yes:1"
set.hidden = true
set.mouse = "a"
set.smartindent = true
set.background = "dark"
set.termguicolors = true
set.cursorline = true
set.undodir = os.getenv("HOME") .. "/.vim/undodir"
set.laststatus = 0
vim.g.mapleader = " "

set.confirm = true -- Confirm to save changes before exiting modified buffer
set.cursorline = true -- Enable highlighting of the current line
set.formatoptions = "jcroqlnt" -- tcqj
set.grepformat = "%f:%l:%c:%m"
set.grepprg = "rg --vimgrep"
set.ignorecase = true -- Ignore case
set.inccommand = "nosplit" -- preview incremental substitute
set.mouse = "a" -- Enable mouse mode
set.pumblend = 10 -- Popup blend
set.pumheight = 10 -- Maximum number of entries in a popup
set.scrolloff = 4 -- Lines of context
set.sessionoptions = { "buffers", "curdir", "tabpages", "winsize" }
set.shortmess:append({ W = true, I = true, c = true })
set.showmode = false -- Dont show mode since we have a statusline
set.sidescrolloff = 8 -- Columns of context
set.smartcase = true -- Don't ignore case with capitals
set.spelllang = { "en" }
set.splitbelow = true -- Put new windows below current
set.splitright = true -- Put new windows right of current
set.termguicolors = true -- True color support
set.timeoutlen = 300
set.undofile = true
set.undolevels = 10000
set.updatetime = 200 -- Save swap file and trigger CursorHold
set.wildmode = "longest:full,full" -- Command-line completion mode
vim.g.skip_ts_context_commentstring_module = true
