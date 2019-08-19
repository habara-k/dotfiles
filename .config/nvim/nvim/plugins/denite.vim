" Denite用プレフィックス
nmap [denite] <Nop>
map <SPACE>d [denite]

" 表示を# から> に変更
call denite#custom#option('default', 'prompt', '>')

" プロジェクト内のファイル検索
nmap <silent> [denite]f :<C-u>Denite file_rec<CR>
" バッファに展開中のファイル検索
nmap <silent> [denite]b :<C-u>Denite buffer<CR>
" プロジェクト内をgrep 検索
nmap <silent> [denite]g :<C-u>Denite grep<CR>
nmap <silent> [denite]w :<C-u>DeniteCursorWord grep<CR>

" 上下移動
call denite#custom#map('insert', '<C-j>', '<denite:move_to_next_line>')
call denite#custom#map('insert', '<C-k>', '<denite:move_to_previous_line>')
" 入力履歴移動
call denite#custom#map('insert', '<C-n>', '<denite:assign_next_text>')
call denite#custom#map('insert', '<C-p>', '<denite:assign_previous_text>')
" オープン
call denite#custom#map('insert', '<C-o>', '<denite:do_action:open>')
call denite#custom#map('insert', '<C-t>', '<denite:do_action:tabopen>')
call denite#custom#map('insert', '<C-v>', '<denite:do_action:vsplit>')

" file_rec検索時にfuzzymatchを有効にし、検索対象から指定のファイルを除外
call denite#custom#source(
    \ 'file_rec', 'matchers', ['matcher_fuzzy', 'matcher_project_files', 'matcher_ignore_globs'])

" 検索対象外のファイル指定
call denite#custom#filter('matcher_ignore_globs', 'ignore_globs',
    \ [ '.git/', '.ropeproject/', '__pycache__/', 'vendor/',
    \   'venv/', 'images/', '*.min.*', 'img/', 'fonts/'])
