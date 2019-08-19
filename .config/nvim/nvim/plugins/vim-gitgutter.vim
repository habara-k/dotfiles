set signcolumn=yes
set updatetime=1000

" GitGutter用プレフィックス
nmap [GitGutter] <Nop>
map <SPACE>g [GitGutter]

nmap <silent> [GitGutter]a :GitGutterAll<CR>
nmap <silent> [GitGutter]n :GitGutterNextHunk<CR>
nmap <silent> [GitGutter]p :GitGutterPrevHunk<CR>
