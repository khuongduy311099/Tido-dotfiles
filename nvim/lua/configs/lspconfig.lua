require("nvchad.configs.lspconfig").defaults()

-- tailwind-tools no longer sets this server up (server.override = false), so the
-- colorProvider capability it used to inject has to be declared here
vim.lsp.config("tailwindcss", {
  capabilities = { textDocument = { colorProvider = { dynamicRegistration = true } } },
})

local servers = { "html", "cssls", "vtsls", "tailwindcss" }
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers 
