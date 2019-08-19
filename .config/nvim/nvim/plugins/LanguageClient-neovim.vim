set hidden

let g:LanguageClient_serverCommands = {}


if executable('pyls')
  let g:LanguageClient_serverCommands['python'] = ['pyls']
endif

if executable('gopls')
  let g:LanguageClient_serverCommands['go'] = ['gopls']
endif


" LanguageClient用プレフィックス
nmap [LanguageClient] <Nop>
map <SPACE>l [LanguageClient]
nmap <silent> [LanguageClient]h :call LanguageClient_textDocument_hover()<CR>
nmap <silent> [LanguageClient]d :call LanguageClient_textDocument_definition()<CR>
nmap <silent> [LanguageClient]r :call LanguageClient_textDocument_rename()<CR>
nmap <silent> [LanguageClient]f :call LanguageClient_textDocument_formatting()<CR>


" セマンティックチェック
augroup LanguageClient_config
  autocmd!
  autocmd User LanguageClientStarted setlocal signcolumn=yes
  autocmd User LanguageClientStopped setlocal signcolumn=auto
augroup END

" 同じ変数をハイライト
augroup LCHighlight
  autocmd!
  autocmd CursorHold,CursorHoldI *.py,*.c,*.cpp call LanguageClient#textDocument_documentHighlight()
augroup END
