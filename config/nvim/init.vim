
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
  Plug 'NLKNguyen/papercolor-theme'
  Plug 'ap/vim-buftabline'
  Plug 'tpope/vim-fugitive'
  Plug 'itchyny/lightline.vim'
  Plug 'Shougo/defx.nvim', {'do': ':UpdateRemotePlugins'}
  Plug 'junegunn/fzf.vim'
call plug#end()

" fzf ------------- {{{
nnoremap <silent> ,a :<C-u>Ag<CR>
nnoremap <silent> ,f :<C-u>Files<CR>
nnoremap <silent> ,g :<C-u>GFiles<CR>
nnoremap <silent> ,b :<C-u>Buffers<CR>
nnoremap <silent> ,m :<C-u>History<CR>
set rtp+=/usr/local/opt/fzf
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

" lightline ------- {{{
let g:lightline = {
    \ 'colorscheme': 'PaperColor',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
    \ },
    \ 'component_function': {
    \   'gitbranch': 'FugitiveHead'
    \ },
    \ }
"}}}


" Basic setting --- {{{
set number
set cursorline
set nobackup
set noswapfile
set autoread
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

autocmd BufWritePre * :%s/\s\+$//ge
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
  autocmd BufNewFile,BufRead *.cpp setlocal tabstop=4 softtabstop=4 shiftwidth=4
augroup END
"}}}

" Color scheme ---- {{{
colorscheme PaperColor
autocmd ColorScheme * highlight Normal ctermbg=None
"}}}

