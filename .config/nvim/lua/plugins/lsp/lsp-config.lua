return {
  "neovim/nvim-lspconfig",
  config = function ()
    local servers = { "lua_ls", "tsserver", "pyright" } -- Languages server
    -- Mason config
    require("mason").setup()
    require("mason-lspconfig").setup {
       ensure_installed = servers,
    }

    -- Add additional capabilities supported by nvim-cmp
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    local lspconfig = require('lspconfig')

    require("eliphaz.settings.cmp-config").setup()
    local on_attach = require("eliphaz.settings.lsp").on_attach()

    -- Use server after mason done installation
    for _,lsp in ipairs(servers) do
      lspconfig[lsp].setup {
        capabilities = capabilities,
        on_attach = on_attach,
      }
    end
  end
}
