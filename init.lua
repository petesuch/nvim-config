-- ~/.config/nvim/init.lua

-- ─── Leader (must come before lazy) ──────────────────────────────────────────
vim.g.mapleader      = "  "
vim.g.maplocalleader = "  "

-- ─── Disable netrw (nvim-tree replacement) ───────────────────────────────────
-- Must be set before any plugin loads, so it lives here rather than in the
-- nvim-tree config block.
vim.g.loaded_netrw       = 1
vim.g.loaded_netrwPlugin = 1

-- ─── UI ───────────────────────────────────────────────────────────────────────
vim.opt.termguicolors  = true
vim.opt.guicursor      = ""
vim.opt.nu             = true
vim.opt.relativenumber = true
vim.opt.scrolloff      = 2
vim.opt.signcolumn     = "yes"
vim.opt.updatetime     = 50
vim.opt.colorcolumn    = "100"
vim.opt.wrap           = false

-- ─── Clipboard ────────────────────────────────────────────────────────────────
vim.opt.clipboard = "unnamedplus"

-- ─── Line endings ─────────────────────────────────────────────────────────────
vim.o.fileformat = "unix"

-- ─── Indentation (global defaults) ───────────────────────────────────────────
vim.opt.expandtab    = true   -- spaces, not tabs
vim.opt.shiftwidth   = 2
vim.opt.tabstop      = 2
vim.opt.softtabstop  = 2
vim.opt.smartindent  = true

-- Python gets PEP-8 width
vim.api.nvim_create_autocmd("FileType", {
  pattern  = "python",
  callback = function()
    vim.opt_local.shiftwidth  = 4
    vim.opt_local.tabstop     = 4
    vim.opt_local.softtabstop = 4
  end,
})

-- ─── Files / undo ─────────────────────────────────────────────────────────────
vim.opt.swapfile = false
vim.opt.backup   = false
vim.opt.undofile = true          -- persistent undo across sessions

-- Auto-reload files changed outside Neovim
vim.opt.autoread = true
vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "FocusGained" }, {
  command = "checktime",
})

-- ─── Search ───────────────────────────────────────────────────────────────────
vim.opt.hlsearch  = false        -- don't keep matches highlighted after search
vim.opt.incsearch = true

-- ─── Stop auto-comment-continuation ──────────────────────────────────────────
vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    vim.opt.formatoptions:remove({ "c", "r", "o" })
  end,
})

-- ─── Treesitter highlighting (built in as of Neovim 0.12) ────────────────────
-- The nvim-treesitter plugin was archived in April 2026 after its rewrite for
-- 0.12 stalled. 0.12 ships parsers and highlighting natively for the
-- languages you were tracking (lua, c, cpp, javascript, vim, vimdoc), so no
-- plugin or setup call is needed here anymore. If you need a parser 0.12
-- doesn't bundle, see :help treesitter-parsers for how to add one.

-- ─── Bootstrap lazy.nvim ─────────────────────────────────────────────────────
-- Neovim 0.12 ships a built-in plugin manager (vim.pack), but it has no
-- event/ft/cmd-based lazy loading, which this config leans on throughout
-- (see the `event` and `keys` keys in lua/plugins/init.lua). Staying on
-- lazy.nvim is the right call unless you want to hand-roll that yourself.
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local out = vim.fn.system({
    "git", "clone",
    "--filter=blob:none",
    "--branch=stable",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out,                            "WarningMsg" },
    }, true, {})
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- ─── Plugins ──────────────────────────────────────────────────────────────────
require("lazy").setup("plugins", {
  ui = { border = "rounded" },
})
