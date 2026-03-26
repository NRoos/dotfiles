vim.cmd.colorscheme("material")

vim.opt.clipboard = 'unnamedplus' -- use system keyboard for yank
vim.opt.nu = true                 -- set line numbers -- set line numbers
vim.opt.relativenumber = true     -- use relative line numbers

vim.opt.wrap = false

-- set tab size to 2 spaces
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.termguicolors = true

vim.opt.colorcolumn = "81"
vim.opt.cursorline = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.gdefault = true

vim.opt.scrolloff = 5
vim.opt.sidescrolloff = 5
vim.opt.sidescroll = 1

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.undofile = true

vim.api.nvim_command('autocmd VimResized * wincmd =')
