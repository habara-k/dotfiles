" Denite用プレフィックス
nmap [denite] <Nop>
map <SPACE>i [denite]

" プロジェクト内のファイル検索
nmap <silent> [denite]f :<C-u>Denite file/rec<CR>
" バッファに展開中のファイル検索
nmap <silent> [denite]b :<C-u>Denite buffer<CR>
" プロジェクト内をgrep 検索
nmap <silent> [denite]g :<C-u>Denite grep<CR>


" file/rec検索時にfuzzymatchを有効にする
call denite#custom#source(
    \ 'file/rec', 'matchers', ['matcher_fuzzy', 'matcher_project_files'])

" 検索対象外のファイル指定
call denite#custom#filter('matcher/ignore_globs', 'ignore_globs',
  \ [ '.git/', '.ropeproject/', '__pycache__/',
  \   'venv/', 'images/', '*.min.*', 'img/', 'fonts/',
  \   'node_modules/'])

" Define mappings
autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <CR>
  \ denite#do_map('do_action')
  nnoremap <silent><buffer><expr> p
  \ denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> o
  \ denite#do_map('do_action', 'open')
  nnoremap <silent><buffer><expr> t
  \ denite#do_map('do_action', 'tabopen')
  nnoremap <silent><buffer><expr> s
  \ denite#do_map('do_action', 'split')
  nnoremap <silent><buffer><expr> v
  \ denite#do_map('do_action', 'vsplit')
  nnoremap <silent><buffer><expr> q
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> i
  \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <Space>
  \ denite#do_map('toggle_select').'j'
endfunction
