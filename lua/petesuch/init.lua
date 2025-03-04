require("petesuch.packer")
require("petesuch.set")
require("petesuch.nvimtree")
require("mason").setup()
require("petesuch.lsp")

--[[ vim.g.mapleader = "  "  -- double spaces
vim.g.maplocalleader = "  " 

vim.g.loaded_netrw = 1
  vim.g.loaded_netrwPlugin = 1

  -- optionally enable 24-bit colour
  vim.opt.termguicolors = true

   ]]-- empty setup using defaults
  --[[ require("nvim-tree").setup()

  -- OR setup with some options
  require("nvim-tree").setup({
    sort = {
      sorter = "case_sensitive",
    },
    view = {
      width = 30,
    },
    renderer = {
      group_empty = true,
    },
    filters = {
      dotfiles = true,
    },
  })

]]
--
-- vim.opt.clipboard = "unnamedplus"
