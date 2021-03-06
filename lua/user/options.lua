vim.opt.backup = false
vim.opt.clipboard = "unnamedplus"
vim.opt.cmdheight = 2
vim.opt.completeopt = { "menuone", "noselect" }
vim.opt.conceallevel = 0
vim.opt.fileencoding = "utf-8"
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.mouse = "a"
vim.opt.pumheight = 10
vim.opt.showmode = false
vim.opt.showtabline = 2
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.termguicolors = true
vim.opt.timeoutlen = 500
vim.opt.undofile = true
vim.opt.updatetime = 50
vim.opt.writebackup = false
vim.opt.expandtab = false
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.numberwidth = 4
vim.opt.signcolumn = "yes"
vim.opt.wrap = false
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.shortmess:append("c")
vim.opt.guicursor = ""
vim.opt.incsearch = true
vim.opt.colorcolumn = "120"
vim.opt.list = true
vim.opt.listchars:append("lead:.")
vim.opt.winbar = "%{%v:lua.require'user.winbar'.get_winbar()%}"
vim.opt.foldcolumn = "2"
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = -1
vim.opt.foldenable = true
vim.opt.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

vim.cmd("set whichwrap+=<,>,[,],h,l")
vim.cmd([[set iskeyword+=-]])
vim.cmd([[set formatoptions-=cro]])

vim.cmd(
	"let g:clipboard = { 'copy': { '+': 'xsel', '*': 'xsel' }, 'paste': { '+': 'xsel', '*': 'xsel' }, 'cache_enabled': 0 }"
)
