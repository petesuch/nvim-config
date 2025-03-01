-- Set leader key
vim.g.mapleader = "  "

-- Cursor and numbering
vim.opt.guicursor = ""
vim.opt.nu = true
vim.opt.relativenumber = true

-- Indentation preferences
vim.opt.expandtab = true      -- Use spaces instead of tabs
vim.opt.shiftwidth = 2        -- Number of spaces for indentation
vim.opt.tabstop = 2           -- Number of spaces per tab character
vim.opt.softtabstop = 2       -- Number of spaces when pressing <Tab>
vim.opt.smartindent = true    -- Enable smart indentation

-- Python-specific indentation
vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = function()
    vim.opt_local.shiftwidth = 4
    vim.opt_local.tabstop = 4
    vim.opt_local.softtabstop = 4
  end,
})

-- UI settings
vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.termguicolors = true
vim.opt.scrolloff = 3
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 50
vim.opt.colorcolumn = "85"

-- Auto-reload files when changed externally
vim.opt.autoread = true
vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "FocusGained" }, {
  command = "checktime",
})

