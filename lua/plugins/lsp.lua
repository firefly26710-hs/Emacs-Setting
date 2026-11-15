--關閉提醒
vim.diagnostic.config({
  virtual_text = false,
  signs = false,
  underline = false,
  update_in_insert = false,
})



require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "lua_ls", "rust_analyzer", "clangd", "jdtls" }
})

local capabilities = require("cmp_nvim_lsp").default_capabilities()


-- lua_ls
vim.lsp.config("lua_ls", {
    capabilities = capabilities,
})
vim.lsp.enable("lua_ls")

--rust_analyzer
vim.lsp.config("rust_analyzer", {
    capabilities = capabilities,
})
vim.lsp.enable("rust_analyzer")

-- clangd
--vim.lsp.config("clangd", {
--    capabilities = capabilities
--})
--vim.lsp.enable("clangd")

vim.lsp.config("jdtls", {
    capabilities = capabilities
})
vim.lsp.enable("jdtls")
