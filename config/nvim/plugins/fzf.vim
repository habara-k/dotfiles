" fzf用プレフィックス
nmap [fzf] <Nop>
map , [fzf]

nnoremap <silent> [fzf]a :<C-u>Ag<CR>
nnoremap <silent> [fzf]f :<C-u>Files<CR>
nnoremap <silent> [fzf]g :<C-u>GFiles<CR>
nnoremap <silent> [fzf]b :<C-u>Buffers<CR>
nnoremap <silent> [fzf]m :<C-u>History<CR>

set rtp+=/usr/local/opt/fzf

