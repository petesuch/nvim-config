require('lspconfig').lua_ls.setup {
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' },  -- Fix "undefined global 'vim'"
      },
      workspace = {
        library = {
          vim.fn.expand("$VIMRUNTIME/lua"),  -- Include Neovim's runtime files
          vim.fn.stdpath("config") .. "/lua",
        },
        checkThirdParty = false, -- Prevent third-party plugin warnings
      },
      telemetry = { enable = false }, -- Disable telemetry
    },
  },
}
