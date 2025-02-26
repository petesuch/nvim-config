vim.g.mapleader = "  "
vim.opt.guicursor = ""
vim.opt.nu = true
vim.opt.relativenumber = true

-- Set global indentation preferences
vim.opt.expandtab = true  -- Use spaces instead of tabs
vim.opt.shiftwidth = 2     -- Number of spaces for indentation
vim.opt.tabstop = 2        -- Number of spaces per tab character
vim.opt.softtabstop = 2    -- Number of spaces when pressing <Tab>

-- Set indentation for Python specifically
vim.api.nvim_create_autocmd("FileType", {
    pattern = "python",
    callback = function()
        vim.opt_local.shiftwidth = 4
        vim.opt_local.tabstop = 4
        vim.opt_local.softtabstop = 4
    end,
})


vim.opt.smartindent = smartindent
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
vim.opt.paste = true
-- Autoreload if file changes in external editor
vim.opt.autoread = true
vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" }, {
  command = "if mode() != 'c' | checktime | endif",
  pattern = { "*" },
})

