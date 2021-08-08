if has('vim_starting')
  set rtp+=~/.vim/plugged/vim-plug
  if !isdirectory(expand('~/.vim/plugged/vim-plug'))
    echo 'install vim-plug...'
    call system('mkdir -p ~/.vim/plugged/vim-plug')
    call system('git clone https://github.com/junegunn/vim-plug.git ~/.vim/plugged/vim-plug/autoload')
  end
endif

call plug#begin('~/.vim/plugged')
  Plug 'junegunn/vim-plug',{'dir': '~/.vim/plugged/vim-plug/autoload'}

  " icons
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'ryanoasis/vim-devicons'

  " color scheme
  Plug 'NLKNguyen/papercolor-theme'

  " indent line
  Plug 'Yggdroot/indentLine'

  " tabline
  Plug 'ap/vim-buftabline'

  " status line
  Plug 'hoob3rt/lualine.nvim'

  " git
  Plug 'airblade/vim-gitgutter'

  " syntax
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

  " file exploler
  Plug 'Shougo/defx.nvim', {'do': ':UpdateRemotePlugins'}
  Plug 'kristijanhusak/defx-icons'

  " finder
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'

  " lsp
  Plug 'neovim/nvim-lspconfig'
  Plug 'nvim-lua/completion-nvim'

  " session
  Plug 'tpope/vim-obsession'
  Plug 'dhruvasagar/vim-prosession'

call plug#end()


" icons ----------- {{{
lua <<EOF
require'nvim-web-devicons'.get_icon(filename, extension, options)
EOF
"}}}


" indent line ----- {{{
let g:indentLine_fileTypeExclude = ['defx']
"}}}


" lspconfig ------- {{{
lua <<EOF
local on_attach = function (client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local opts = { noremap=true, silent=true }

  buf_set_keymap('n', '<SPACE>d', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

  require'completion'.on_attach(client, bufnr)
end

require'lspconfig'.clangd.setup{on_attach=on_attach}
require'lspconfig'.pyright.setup{on_attach=on_attach}
EOF
"}}}


" completion ------ {{{
" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c
"}}}


" lualine --------- {{{
lua <<EOF
require'lualine'.setup{
  options = {theme = 'PaperColor'},
}
EOF
"}}}


" telescope ------- {{{
nnoremap <silent> ,f <cmd>Telescope find_files<cr>
nnoremap <silent> ,g <cmd>Telescope git_files<cr>
nnoremap <silent> ,r <cmd>Telescope live_grep<cr>
nnoremap <silent> ,b <cmd>Telescope buffers<cr>
lua <<EOF
require'telescope'.setup{
  defaults = {
    mappings = {
      n = {
        ["q"] = require'telescope.actions'.close
      },
    },
  }
}
require'nvim-web-devicons'.get_icon(filename, extension, options)
EOF
"}}}


" treesitter ------ {{{
lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
  },
  ensure_installed = 'maintained'
}
EOF
"}}}


" gitgutter ------- {{{
nnoremap <silent> g] :GitGutterNextHunk<CR>
nnoremap <silent> g[ :GitGutterPrevHunk<CR>
"}}}


" defx ------------ {{{
nnoremap <silent><C-f> :<C-u>Defx<CR>
autocmd FileType defx call s:defx_my_settings()
function! s:defx_my_settings() abort
  nnoremap <silent><buffer><expr> <CR>
   \ defx#do_action('open')
  nnoremap <silent><buffer><expr> c
  \ defx#do_action('copy')
  nnoremap <silent><buffer><expr> m
  \ defx#do_action('move')
  nnoremap <silent><buffer><expr> p
  \ defx#do_action('paste')
  nnoremap <silent><buffer><expr> l
  \ defx#do_action('drop')
  nnoremap <silent><buffer><expr> K
  \ defx#do_action('new_directory')
  nnoremap <silent><buffer><expr> N
  \ defx#do_action('new_file')
  nnoremap <silent><buffer><expr> d
  \ defx#do_action('remove')
  nnoremap <silent><buffer><expr> r
  \ defx#do_action('rename')
  nnoremap <silent><buffer><expr> yy
  \ defx#do_action('yank_path')
  nnoremap <silent><buffer><expr> .
  \ defx#do_action('toggle_ignored_files')
  nnoremap <silent><buffer><expr> h
  \ defx#do_action('cd', ['..'])
  nnoremap <silent><buffer><expr> q
  \ defx#do_action('quit')
endfunction
"}}}


" Basic setting --- {{{
set number
set cursorline
set nobackup
set noswapfile
set autoread
set hidden
set clipboard=unnamedplus
set foldmethod=marker
set virtualedit=onemore
set scrolloff=3
set backspace=indent,eol,start
set list listchars=tab:»-,trail:･,nbsp:⍽,extends:»,precedes:«

nnoremap j gj
nnoremap k gk
nnoremap <C-n> :<C-u>bnext<CR>
nnoremap <C-p> :<C-u>bprev<CR>
"}}}


" Tab setting ----- {{{
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent
set smartindent

augroup fileTypeIndent
  autocmd!
  autocmd BufNewFile,BufRead *.py setlocal tabstop=4 softtabstop=4 shiftwidth=4
  autocmd BufNewFile,BufRead *.cpp setlocal tabstop=4 softtabstop=4 shiftwidth=4
  autocmd BufNewFile,BufRead *.hpp setlocal tabstop=4 softtabstop=4 shiftwidth=4
augroup END
"}}}


" Color scheme ---- {{{
colorscheme PaperColor
hi Normal ctermbg=None
"}}}

