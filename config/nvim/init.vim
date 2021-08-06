if !&compatible
  set nocompatible
endif

" reset augroup
augroup MyAutoCmd
  autocmd!
augroup END

" dein settings {{{
" dein自体の自動インストール
let s:cache_home = empty($XDG_CACHE_HOME) ? expand('~/.cache') : $XDG_CACHE_HOME
let s:dein_dir = s:cache_home . '/dein'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if !isdirectory(s:dein_repo_dir)
  call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
endif
let &runtimepath = s:dein_repo_dir .",". &runtimepath
" プラグイン読み込み＆キャッシュ作成
let s:toml_file = fnamemodify(expand('<sfile>'), ':h').'/dein.toml'
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)
  call dein#load_toml(s:toml_file)
  call dein#end()
  call dein#save_state()
endif
" 不足プラグインの自動インストール
if has('vim_starting') && dein#check_install()
  call dein#install()
endif
" }}}


" Basic Setting {{{
  set number
  set cursorline
  set nobackup
  set noswapfile
  set autoread
  set clipboard=unnamedplus

  nnoremap <C-h>      :<C-u>help<Space>
  nnoremap <C-h><C-h> :<C-u>help<Space><C-r><C-w><CR>

  " カーソルの左右移動で行末から次の行の行頭への移動が可能になる
  set whichwrap=b,s,h,l,<,>,[,]
  nnoremap j gj
  nnoremap k gk
  " 行末の1文字先までカーソルを移動できるように
  set virtualedit=onemore

  " 余裕を持ってスクロール
  set scrolloff=3

  "BSで削除できるものを指定する
  " indent  : 行頭の空白
  " eol     : 改行
  " start   : 挿入モード開始位置より手前の文字
  set backspace=indent,eol,start

  " 不可視文字の表示
  set list
  " tab: »-
  " 行末の空白: ･
  " ノーブレークスペース: ⍽
  " 画面の右側に文字があるとき: »
  " 画面の左側に文字があるとき: «
  set listchars=tab:»-,trail:･,nbsp:⍽,extends:»,precedes:«

  " タブ間の移動
  nnoremap <C-n> :<C-u>bnext<CR>
  nnoremap <C-p> :<C-u>bprev<CR>

  " 末尾の空白を削除
  autocmd BufWritePre * :%s/\s\+$//ge

"}}}"


" Tab Setting {{{

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

"}}}"


" Theme {{{

set background=dark
colorscheme PaperColor
autocmd ColorScheme * highlight Normal ctermbg=None

"}}}"

