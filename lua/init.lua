-- ~/.config/nvim/lua/plugins/init.lua
-- All plugin specs in one file.  Split into separate files under lua/plugins/
-- (e.g. lua/plugins/lsp.lua) whenever this grows unwieldy -- lazy.nvim loads
-- every file in that directory automatically.

return {

  -- ─── Telescope ────────────────────────────────────────────────────────────
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",              -- bump from 0.1.2; 0.12 compat fixes are here
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<cr>",  desc = "Find files" },
      { "<leader>fg", "<cmd>Telescope live_grep<cr>",   desc = "Live grep" },
      { "<leader>fb", "<cmd>Telescope buffers<cr>",     desc = "Buffers" },
    },
  },

  -- Treesitter highlighting is now built into Neovim 0.12 itself — see the
  -- note in init.lua. The plugin and its config block are gone.

  -- ─── File tree ────────────────────────────────────────────────────────────
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "File tree" },
    },
    config = function()
      -- nvim-tree recommends disabling netrw
      vim.g.loaded_netrw       = 1
      vim.g.loaded_netrwPlugin = 1
      require("nvim-tree").setup()
    end,
  },

-- --- TokyoNight -------------------------------------------------------------
{
  "folke/tokyonight.nvim",
  lazy = false,      -- load at startup since it's the colorscheme
  priority = 1000,   -- load before anything else that touches highlights
  config = function()
    require("tokyonight").setup({
      style = "night",   -- "storm" | "night" | "moon" | "day"
      on_colors = function(colors)
        colors.bg      = "#000000"
        colors.bg_dark = "#000000"
      end,
    })
    vim.cmd.colorscheme("tokyonight")
  end,
},

  -- ─── Lualine ──────────────────────────────────────────────────────────────
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",
    config = function()
      require("lualine").setup({
        -- "papercolor_light" clashed with the tokyonight/black background
        -- above; "tokyonight" matches the colorscheme you're actually using.
        options = { theme = "tokyonight" },
      })
    end,
  },

  -- ─── Commenting ───────────────────────────────────────────────────────────
  {
    "numToStr/Comment.nvim",
    event = "BufReadPost",
    config = true,              -- calls require("Comment").setup() for you
  },

  -- ─── LSP ──────────────────────────────────────────────────────────────────
  -- As of mason-lspconfig v2 (paired with Neovim 0.11+'s native vim.lsp.config
  -- API), setup_handlers()/handlers and automatic_installation are gone.
  -- Servers are declared with vim.lsp.config() and auto-enabled via
  -- automatic_enable, which is mason-lspconfig's default.

  -- Mason: installs language servers, linters, formatters
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    config = true,
  },

  -- mason-lspconfig: installs + auto-enables the servers listed below
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    opts = {
      -- Servers listed here are auto-installed when missing, and
      -- auto-enabled via vim.lsp.enable() once installed.
      ensure_installed = {
        "lua_ls",
        "clangd",
        "pyright",
        "ts_ls",
      },
    },
  },

  -- nvim-lspconfig: supplies the vim.lsp.config() defaults mason-lspconfig
  -- and vim.lsp.enable() build on
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",       -- feeds LSP capabilities into cmp
    },
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- Keymaps applied only in buffers that have an active LSP client.
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspAttach", { clear = true }),
        callback = function(ev)
          local opts = { buffer = ev.buf }
          vim.keymap.set("n", "gd",         vim.lsp.buf.definition,      opts)
          vim.keymap.set("n", "gD",         vim.lsp.buf.declaration,     opts)
          vim.keymap.set("n", "gi",         vim.lsp.buf.implementation,  opts)
          vim.keymap.set("n", "gr",         vim.lsp.buf.references,      opts)
          vim.keymap.set("n", "K",          vim.lsp.buf.hover,           opts)
          vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename,          opts)
          vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action,     opts)
          vim.keymap.set("n", "<leader>f",  function()
            vim.lsp.buf.format({ async = true })
          end, opts)
        end,
      })

      -- Capabilities apply to every server unless overridden below.
      vim.lsp.config("*", {
        capabilities = capabilities,
      })

      -- Server-specific settings, applied via the new native API. Servers
      -- not listed here just use nvim-lspconfig's shipped defaults.
      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } },  -- stop "undefined global vim" warnings
            workspace = { checkThirdParty = false },
          },
        },
      })
    end,
  },

  -- ─── Completion ───────────────────────────────────────────────────────────
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      local cmp     = require("cmp")
      local luasnip = require("luasnip")

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"]     = cmp.mapping.abort(),
          ["<CR>"]      = cmp.mapping.confirm({ select = true }),
          ["<Tab>"]     = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"]   = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer" },
          { name = "path" },
        }),
      })
    end,
  },
}
