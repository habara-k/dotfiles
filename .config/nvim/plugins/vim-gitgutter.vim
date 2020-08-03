set signcolumn=yes
set updatetime=1000

" Git用プレフィックス
nmap [Git] <Nop>
map <SPACE>g [Git]

nmap <silent> [Git]a :GitGutterAll<CR>
nmap <silent> [Git]n :GitGutterNextHunk<CR>
nmap <silent> [Git]p :GitGutterPrevHunk<CR>
