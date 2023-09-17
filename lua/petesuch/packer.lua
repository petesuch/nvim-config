vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.2',
  }

  use {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
  }

  -- Lualine and nvim-tree need devicons
  use { 'nvim-tree/nvim-web-devicons' }
  use {
    'nvim-lualine/lualine.nvim',
  }
  use {
    'nvim-tree/nvim-tree.lua',
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'L3MON4D3/LuaSnip'},
    }
  }

use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
}

end)
