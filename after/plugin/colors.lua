--  colors.lua
--  lualine and tokyonight get configured here

require('lualine').setup {
  options = {
    icons_enabled = true,
    --theme = 'auto',
    --theme = 'dracula',
    --theme = 'powerline_dark',
    theme = 'PaperColor',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}

--require("tokyonight").setup({
 -- style = "storm", -- Try "storm", "night", "moon", or "day"
  --transparent = false, -- Change to true if you want a transparent background
 -- terminal_colors = true, -- Ensure terminal colors are applied
--})
--vim.cmd("colorscheme tokyonight")


vim.cmd("highlight Normal guibg=#000000")


-- OneDark
 -- Tokyonight
-- require("tokyonight").setup({
--   style = "storm", -- Try "storm", "night", "moon", or "day"
--   transparent = false, -- Change to true if you want a transparent background
--   terminal_colors = true, -- Ensure terminal colors are applied
--   -- style = "moon",
--   -- Change the "hint" color to the "orange" color, and make the "error" color bright red
--   on_colors = function(colors)
--     colors.hint = colors.orange
--     colors.error = "#ff0000"
--     colors.bg_dark = "#00000"
--     colors.bg = "#000000"  -- THIS is the real background for most editing 
--   end
-- })
-- vim.cmd[["colorscheme tokyonight"]]
