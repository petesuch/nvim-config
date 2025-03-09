----setup with some options
require'nvim-tree'.setup {
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 30,
  },
  filters = {
    dotfiles = false,
  },
  renderer = {
    icons = {
      glyphs = {
        default = '',
        symlink = '',
        git = {
          unstaged = "✗",
          staged = "✓",
          unmerged = "",
          renamed = "➜",
          untracked = "★",
          deleted = "",
          ignored = "◌"
        },
        folder = {
          arrow_open = "",
          arrow_closed = "",
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
          symlink_open = "",
        },
      }
    }
  }
}

