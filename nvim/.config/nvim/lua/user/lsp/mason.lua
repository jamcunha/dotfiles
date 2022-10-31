local mason_status_ok, mason = pcall(require, "mason")
if not mason_status_ok then return end

local mason_lsp_config_status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lsp_config_status_ok then return end

local servers = {
  "bashls",
  "clangd",
  "cmake",
  "cssls",
  -- "gopls",
  "gradle_ls",
  "html",
  -- "hls",
  "jsonls",
  "jdtls",
  "tsserver",
  -- "kotlin_language_server",
  "sumneko_lua",
  -- "jedi_language_server",
  -- "rust_analyser",
  "sqls",
  -- "svelte",
  "tailwindcss",
  -- "volar",
  "yamlls",
}

mason.setup()

mason_lspconfig.setup({
  ensure_installed = servers
})

