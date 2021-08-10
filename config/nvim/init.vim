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

  " icons
  Plug 'kyazdani42/nvim-web-devicons'

  " color scheme
  Plug 'NLKNguyen/papercolor-theme'
  Plug 'joshdick/onedark.vim'
  Plug 'tomasr/molokai'
  Plug 'morhetz/gruvbox'

  " indent line
  Plug 'lukas-reineke/indent-blankline.nvim'

  " tabline
  Plug 'ap/vim-buftabline'

  " status line
  Plug 'hoob3rt/lualine.nvim'

  " git
  Plug 'airblade/vim-gitgutter'
  Plug 'tpope/vim-fugitive'

  Plug 'zsh-users/zsh-history-substring-search'

  " syntax
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

  " file exploler
  Plug 'kyazdani42/nvim-tree.lua'

  " finder
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'

  " lsp
  Plug 'neovim/nvim-lspconfig'
  Plug 'nvim-lua/completion-nvim'
  Plug 'nvim-lua/lsp_extensions.nvim'

  " session
  Plug 'rmagatti/auto-session'
  Plug 'rmagatti/session-lens'

  " autopairs
  Plug 'windwp/nvim-autopairs'
  Plug 'windwp/nvim-ts-autotag'
call plug#end()


" auto pairs/tags - {{{
lua <<EOF
require'nvim-autopairs'.setup{}
require'nvim-ts-autotag'.setup{}

local remove_rules = {vim = '"', rust = "'"}
for lang, char in pairs(remove_rules) do
  require'nvim-autopairs'.get_rule(char)
    :with_pair(function() return vim.bo.filetype ~= lang end)
end
EOF
"}}}


" session --------- {{{
lua <<EOF
require('auto-session').setup{
  log_level = 'error',
}
EOF
"}}}


" git ------------- {{{
set updatetime=100
nnoremap <silent> g] :GitGutterNextHunk<CR>
nnoremap <silent> g[ :GitGutterPrevHunk<CR>
nnoremap <silent> gs :Git<CR>
nnoremap <silent> ga :Gwrite<CR>
nnoremap <silent> gc :Git commit<CR>
nnoremap <silent> gp :Git push<CR>
nnoremap <silent> gd :Gdiff<CR>
nnoremap <silent> gb :Git blame<CR>
"}}}


" file exploler --- {{{
nnoremap <silent> <C-f> :NvimTreeToggle<CR>
"}}}


" lspconfig ------- {{{
lua <<EOF
local on_attach = function (client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local opts = { noremap=true, silent=true }

  buf_set_keymap('n', '<SPACE>d', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

  require'completion'.on_attach(client, bufnr)
end

local servers = {'clangd', 'pyright', 'rust_analyzer'}
for _, lsp in ipairs(servers) do
  require'lspconfig'[lsp].setup{on_attach=on_attach}
end
EOF

autocmd BufEnter,BufWinEnter,BufWritePost,InsertLeave,TabEnter,CursorHold,CursorMoved *.rs :lua require'lsp_extensions'.inlay_hints{ prefix = '', highlight = "Comment", enabled = {"TypeHint", "ChainingHint", "ParameterHint"}}
"}}}


" completion ------ {{{
" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c
"}}}


" lualine --------- {{{
lua <<EOF
require'lualine'.setup{
  options = {
    theme = 'onedark',
    component_separators = {'', ''},
    section_separators = {'', ''},
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch'},
    lualine_c = {'filename'},
    lualine_x = {
      {
        'diagnostics',
        sources = {"nvim_lsp"},
        symbols = {error = ' ', warn = ' ', info = ' ', hint = ' '}
      },
      'encoding',
      'filetype'
    },
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
}
EOF
"}}}


" telescope ------- {{{
nnoremap <silent> ,f <cmd>Telescope find_files<cr>
nnoremap <silent> ,g <cmd>Telescope git_files<cr>
nnoremap <silent> ,a <cmd>Telescope live_grep<cr>
nnoremap <silent> ,b <cmd>Telescope buffers<cr>
nnoremap <silent> ,r <cmd>Telescope command_history<cr>
lua <<EOF
require'telescope'.setup{
  defaults = {
    mappings = {
      n = {
        ["q"] = require'telescope.actions'.close
      },
    },
  }
}
EOF
"}}}


" treesitter ------ {{{
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = 'maintained'
}
EOF
"}}}


" Basic setting --- {{{
language en_US
set termguicolors
set number
set cursorline
set nobackup
set noswapfile
set autoread
set hidden
set clipboard=unnamedplus
set foldmethod=marker
set virtualedit=onemore
set scrolloff=3
set backspace=indent,eol,start
set list listchars=tab:»-,trail:･,nbsp:⍽,extends:»,precedes:«

nnoremap j gj
nnoremap k gk
nnoremap <C-n> :bnext<CR>
nnoremap <C-p> :bprev<CR>
nnoremap <C-q> :quit<CR>
nnoremap <C-b> :bw<CR>
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
  autocmd BufNewFile,BufRead *.hpp setlocal tabstop=4 softtabstop=4 shiftwidth=4
augroup END
"}}}


" Color scheme ---- {{{
colorscheme papercolor

" for tmux active/inactive window highlighting
" tempolary turned off due to session-lens
"hi Normal ctermbg=None guibg=None
"}}}

