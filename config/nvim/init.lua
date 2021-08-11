require'plugins'


-- basic -------------{{{
vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.hidden = true
vim.opt.clipboard = 'unnamedplus'
vim.opt.foldmethod = 'marker'
vim.opt.virtualedit = 'onemore'
vim.opt.scrolloff = 3
vim.opt.backspace = {'indent', 'eol', 'start'}
vim.opt.list = true
vim.api.nvim_set_var('python_host_prog', '~/.asdf/shims/python')
vim.api.nvim_set_var('python3_host_prog', '~/.asdf/shims/python3')
--}}}


-- move --------------{{{
vim.api.nvim_set_keymap('n', 'j', 'gj', {noremap = true})
vim.api.nvim_set_keymap('n', 'k', 'gk', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-n>', ':bnext<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-p>', ':bprev<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-q>', ':quit<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-b>', ':bw<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<Up>', '<C-w>k', {noremap = true})
vim.api.nvim_set_keymap('n', '<Down>', '<C-w>j', {noremap = true})
vim.api.nvim_set_keymap('n', '<Left>', '<C-w>h', {noremap = true})
vim.api.nvim_set_keymap('n', '<Right>', '<C-w>l', {noremap = true})
--}}}


-- color scheme ------{{{
vim.cmd'colorscheme papercolor'
vim.cmd'hi Normal ctermbg=None guibg=None'
--}}}


-- tab ---------------{{{
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true

vim.cmd[[
augroup fileTypeIndent
  autocmd!
  autocmd BufNewFile,BufRead *.py setlocal tabstop=4 softtabstop=4 shiftwidth=4
  autocmd BufNewFile,BufRead *.cpp setlocal tabstop=4 softtabstop=4 shiftwidth=4
  autocmd BufNewFile,BufRead *.hpp setlocal tabstop=4 softtabstop=4 shiftwidth=4
augroup END
]]
--}}}
