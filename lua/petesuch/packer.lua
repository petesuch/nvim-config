vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer manages itself
  use 'wbthomason/packer.nvim'

  --  Navarasu onedark with higher contrast settings for people with early cataracts

  use {
    'petesuch/darkpeter.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require("darkpeter").setup({
        style = "dark",
        term_colors = true, -- Ensure terminal colors match
        colors = { bg = "#000000" } -- Force pure black background
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
    run = ":TSUpdate"
  }

  -- Lualine: Status line with devicons
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons' }
  }

  -- Nvim-tree: File explorer
  use {
    'nvim-tree/nvim-tree.lua',
    requires = { 'nvim-tree/nvim-web-devicons' }
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
