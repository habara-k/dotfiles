vim.cmd[[packadd packer.nvim]]

require'packer'.startup(function()
  use'wbthomason/packer.nvim'

  use'NLKNguyen/papercolor-theme'
  use'joshdick/onedark.vim'

  use {
    'airblade/vim-gitgutter',
    config = function()
      vim.opt.updatetime = 100
      vim.api.nvim_set_keymap('n', 'g]', ':GitGutterNextHunk<CR>', {noremap = true})
      vim.api.nvim_set_keymap('n', 'g[', ':GitGutterPrevHunk<CR>', {noremap = true})
    end,
  }
  use {
    'tpope/vim-fugitive',
    config = function()
      vim.api.nvim_set_keymap('n', 'gs', ':Git<CR>', {noremap = true})
      vim.api.nvim_set_keymap('n', 'ga', ':Gwrite<CR>', {noremap = true})
      vim.api.nvim_set_keymap('n', 'gc', ':Git commit<CR>', {noremap = true})
      vim.api.nvim_set_keymap('n', 'gp', ':Git push<CR>', {noremap = true})
      vim.api.nvim_set_keymap('n', 'gd', ':Gdiff<CR>', {noremap = true})
      vim.api.nvim_set_keymap('n', 'gb', ':Git blame<CR>', {noremap = true})
    end,
  }

  use {
    'rmagatti/auto-session',
    config = function()
      require('auto-session').setup{
        log_level = 'error',
      }
      vim.api.nvim_set_var('auto_session_pre_save_cmds', { ':NvimTreeClose' })
    end,
  }

  use'ap/vim-buftabline'
  use'lukas-reineke/indent-blankline.nvim'
  use {
    'hoob3rt/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true},
    config = function()
      require'lualine'.setup{
        options = {
          theme = 'onedark',
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
    end,
  }

  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      vim.api.nvim_set_keymap(
        'n', '<C-f>', ':NvimTreeToggle<CR>', {noremap = true})

      local tree_cb = require'nvim-tree.config'.nvim_tree_callback
      vim.g.nvim_tree_bindings = {
        { key = "l",     cb = tree_cb("edit") },
        { key = "h",     cb = tree_cb("close_node") },
      }
    end,
  }

  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
    config = function()
      vim.api.nvim_set_keymap('n', ',f', ':Telescope find_files<CR>', {noremap = true})
      vim.api.nvim_set_keymap('n', ',g', ':Telescope git_files<CR>', {noremap = true})
      vim.api.nvim_set_keymap('n', ',a', ':Telescope live_grep<CR>', {noremap = true})
      vim.api.nvim_set_keymap('n', ',b', ':Telescope buffers<CR>', {noremap = true})
      vim.api.nvim_set_keymap('n', ',r', ':Telescope command_history<CR>', {noremap = true})
      require'telescope'.setup{
        defaults = {
          mappings = {
            n = {
              ["q"] = require'telescope.actions'.close
            },
          },
        }
      }
    end,
  }

  use {
    'windwp/nvim-autopairs',
    config = function()
      local npairs = require'nvim-autopairs'

      npairs.setup{}

      local remove_rules = {vim = '"', rust = "'"}
      for lang, char in pairs(remove_rules) do
        npairs.get_rule(char)
          :with_pair(function() return vim.bo.filetype ~= lang end)
      end

      _G.MUtils= {}
      vim.g.completion_confirm_key = ""
      MUtils.completion_confirm=function()
        if vim.fn.pumvisible() ~= 0  then
          if vim.fn.complete_info()["selected"] ~= -1 then
            require'completion'.confirmCompletion()
            return npairs.esc("<c-y>")
          else
            vim.api.nvim_select_popupmenu_item(0 , false , false ,{})
            require'completion'.confirmCompletion()
            return npairs.esc("<c-n><c-y>")
          end
        else
          return npairs.autopairs_cr()
        end
      end

      vim.api.nvim_set_keymap(
        'i', '<CR>', 'v:lua.MUtils.completion_confirm()',
        {expr = true , noremap = true})

      vim.api.nvim_set_keymap(
        'i', '<C-h>', '<BS>', {})
    end,
  }
  use {
    'windwp/nvim-ts-autotag',
    config = function() require'nvim-ts-autotag'.setup{} end,
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function()
      require'nvim-treesitter.configs'.setup {
        ensure_installed = 'maintained'
      }
    end,
  }
  use {'neovim/nvim-lspconfig',
    config = function()
      local nvim_lsp = require('lspconfig')
      local on_attach = function (client, bufnr)
        local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
        local opts = { noremap=true, silent=true }

        buf_set_keymap('n', '<SPACE>d', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
        buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
        buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

        require'completion'.on_attach(client)
      end
      local servers = {'clangd', 'pyright', 'rust_analyzer'}
      for _, lsp in ipairs(servers) do
        nvim_lsp[lsp].setup{on_attach=on_attach}
      end
    end,
  }
  use {
    'nvim-lua/completion-nvim',
    config = function()
      local function t(str)
        return vim.api.nvim_replace_termcodes(str, true, true, true)
      end
      function _G.smart_tab()
        return vim.fn.pumvisible() == 1 and t'<C-n>' or t'<Tab>'
      end
      vim.api.nvim_set_keymap('i', '<Tab>', 'v:lua.smart_tab()', {expr = true, noremap = true})

      vim.o.completeopt = 'menuone,noinsert,noselect'
      vim.o.shortmess = vim.o.shortmess .. 'c'
    end,
  }
  use {
    'nvim-lua/lsp_extensions.nvim',
    config = function()
      vim.cmd'autocmd BufEnter,BufWinEnter,BufWritePost,InsertLeave,TabEnter,CursorHold,CursorMoved *.rs :lua require"lsp_extensions".inlay_hints{ prefix = "", highlight = "Comment", enabled = {"TypeHint", "ChainingHint", "ParameterHint"}}'
    end,
  }
end)

