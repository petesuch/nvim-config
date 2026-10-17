return {
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      on_attach = function(buf)
        local gs = require("gitsigns")
        local map = function(lhs, rhs, desc)
          vim.keymap.set("n", lhs, rhs, { buffer = buf, desc = desc })
        end
        map("]h", function() gs.nav_hunk("next") end, "Next hunk")
        map("[h", function() gs.nav_hunk("prev") end, "Prev hunk")
        map("<leader>gs", gs.stage_hunk,    "Stage hunk")
        map("<leader>gr", gs.reset_hunk,    "Reset hunk")
        map("<leader>gp", gs.preview_hunk,  "Preview hunk")
        map("<leader>gB", gs.blame_line,    "Blame line")
      end,
    },
  },

  {
    "tpope/vim-fugitive",
    cmd = { "Git", "G", "Gdiffsplit", "Gvdiffsplit" },
    keys = { { "<leader>gg", "<cmd>Git<cr>", desc = "Git status" } },
  },

  {
    "pwntester/octo.nvim",
    cmd = "Octo",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    opts = {},
  },
}
