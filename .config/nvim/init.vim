" Dein Setting --------------------------------------------------{{{

  " プラグインがインストールされるディレクトリ
  let s:dein_dir = expand('~/.cache/dein')

  " dein.vim がなければ github から落としてくる
  if &runtimepath !~# '/dein.vim'
    " dein.vim 本体
    let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

    if !isdirectory(s:dein_repo_dir)
      execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
    endif
    execute 'set runtimepath^=' . s:dein_repo_dir
  endif

  " 設定開始
  if dein#load_state(s:dein_dir)
    call dein#begin(s:dein_dir)

    " プラグインリストを収めた TOML ファイル
    " 予め TOML ファイルを用意しておく
    let g:rc_dir    = expand("~/.config/nvim/")
    let s:toml      = g:rc_dir . '/dein.toml'
    let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

    " TOML を読み込み、キャッシュしておく
    call dein#load_toml(s:toml,      {'lazy': 0})
    call dein#load_toml(s:lazy_toml, {'lazy': 1})

    " 設定終了
    call dein#end()
    call dein#save_state()
  endif

  " もし、未インストールものものがあったらインストール
  if dein#check_install()
    call dein#install()
  endif

"}}}"

" Basic Setting -------------------------------------------------{{{

  " カラースキーマ
  syntax enable
  set background=dark
  colorscheme PaperColor

  set statusline=%<[%n]%m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}%y\ %f%=%{fugitive#statusline()}\ \%l/%L,%c%V\ \%P
  set statusline^=%{coc#status()}

  " 行番号を表示
  set number

  " 現在行を強調
  set cursorline

  " バックアップファイルを作らない
  set nobackup
  " スワップファイルを作らない
  set noswapfile
  " 編集中のファイルが変更されたら自動で読み直す
  set autoread

  " ヤンクでクリップボードにコピー
  set clipboard=unnamedplus

  " ヘルプ用
  nnoremap <C-h>      :<C-u>help<Space>
  nnoremap <C-h><C-h> :<C-u>help<Space><C-r><C-w><CR>

  " カーソルの左右移動で行末から次の行の行頭への移動が可能になる
  set whichwrap=b,s,h,l,<,>,[,]
  " 行が折り返し表示されていた場合、行単位ではなく表示行単位でカーソルを移動する
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


" Tab Setting ---------------------------------------------------{{{

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
