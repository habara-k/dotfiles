" Coc用プレフィックス
nmap [Coc] <Nop>
map <SPACE>c [Coc]

nmap <silent> [Coc]d <Plug>(coc-definition)
nmap <silent> [Coc]y <Plug>(coc-type-definition)
nmap <silent> [Coc]i <Plug>(coc-implementation)
nmap <silent> [Coc]r <Plug>(coc-references)

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1] =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
