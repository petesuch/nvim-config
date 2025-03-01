-- set.lua: Neovim settings and key mappings

-- 🌟 Leader Key
vim.g.mapleader = "  "  -- I like double spaces

-- 🌟 UI Settings
vim.opt.guicursor = ""
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.opt.scrolloff = 3
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 50
vim.opt.colorcolumn = "85"

-- 🌟 Indentation
vim.opt.expandtab = true   -- Use spaces instead of tabs
vim.opt.shiftwidth = 2     -- Number of spaces for indentation
vim.opt.tabstop = 2        -- Number of spaces per tab character
vim.opt.softtabstop = 2    -- Number of spaces when pressing <Tab>
vim.opt.smartindent = true -- Enable smart indentation

-- Python-specific indentation
vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = function()
    vim.opt_local.shiftwidth = 4
    vim.opt_local.tabstop = 4
    vim.opt_local.softtabstop = 4
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "lua",
  callback = function()
    vim.opt_local.shiftwidth = 4
    vim.opt_local.tabstop = 4
    vim.opt_local.softtabstop = 4
  end,
})

-- 🌟 Other Editor Behavior
vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.autoread = true  -- Auto-reload files if changed externally
vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "FocusGained" }, {
  command = "checktime",
})

-- 🌟 Key Mappings
-- Open NvimTree safely (if installed)
if vim.fn.exists(":NvimTreeToggle") == 2 then
  vim.keymap.set("n", "<leader>ex", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
else
  print("Warning: NvimTree not installed!")
end

