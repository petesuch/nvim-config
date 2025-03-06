vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer manages itself
  use 'wbthomason/packer.nvim'

  use {
    --  Navarasu/onedark with higher contrast settings for people
    --  with early cataracts and color deficiencies
    'petesuch/darkpeter.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require("darkpeter").setup({
        style = "deep",
        term_colors = true, -- Ensure terminal colors match
      })
      require("darkpeter").load()
    end
  }

  -- Telescope for fuzzy finding
  use {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.2',
    requires = { 'nvim-lua/plenary.nvim' }
  }

  -- Treesitter for syntax highlighting
  use {
    'nvim-treesitter/nvim-treesitter',
<<<<<<< HEAD
    run = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end,
  }

  require'nvim-treesitter.configs'.setup {
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false
    },
    ensure_installed = {
      "lua",
      "python",
      "c",
      "cpp",
      "javascript",
      "typescript"
    },
  }

  -- Similar to netrw but nicer
=======
    run = ":TSUpdate"
  }


  require'nvim-treesitter.configs'.setup {
    highlight = { enable = true },
    ensure_installed = { "lua", "python", "c", "cpp" }, -- Add other languages if needed
  }


>>>>>>> 83afcce (clean up)
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons',
    },
  }

  -- Lualine: Status line with devicons
  use {
    'nvim-lualine/lualine.nvim',
    requires = {
      'nvim-tree/nvim-web-devicons',
    },
  }

  -- LSP Setup (Language Server Protocol)
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    requires = {
      {'neovim/nvim-lspconfig'},  -- Base LSP configurations
      {'williamboman/mason.nvim'},  -- LSP installer
      {'williamboman/mason-lspconfig.nvim'},  -- Bridge for Mason & LSPConfig
      {'hrsh7th/nvim-cmp'},  -- Autocompletion framework
      {'hrsh7th/cmp-nvim-lsp'},  -- Completion source for LSP
      {'L3MON4D3/LuaSnip'},  -- Snippet engine
    }
  }

  -- Comment.nvim for easy commenting
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }
end)
