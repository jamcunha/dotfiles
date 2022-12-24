local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then return end

local cmp_status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_status_ok then return end

local typescript_status_ok, typescript = pcall(require, "typescript")
if not typescript_status_ok then return end

local schemastore_status_ok, schemastore = pcall(require, "schemastore")
if not schemastore_status_ok then return end

--[[ local signs = {
  { name = "DiagnosticSignError", text = "" },
  { name = "DiagnosticSignWarn", text = "" },
  { name = "DiagnosticSignHint", text = "" },
  { name = "DiagnosticSignInfo", text = "" },
}

for _, sign in ipairs(signs) do
  vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end ]]

local keymap = vim.keymap.set

-- Enable keybinds for enabled LSP server
local on_attach = function(client, bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }

  keymap("n", "gf", ":Lspsaga lsp_finder<CR>", opts)
  keymap("n", "gD", ":lua vim.lsp.buf.declaration()<CR>", opts)
  keymap("n", "gd", ":Lspsaga peek_definition<CR>", opts)
  keymap("n", "gi", ":lua vim.lsp.buf.implementation()<CR>", opts)
  keymap("n", "<leader>ca", ":Lspsaga code_action<CR>", opts)
  keymap("n", "<leader>rn", ":Lspsaga rename<CR>", opts)
  keymap("n", "gl", ":Lspsaga show_line_diagnostics<CR>", opts)
  keymap("n", "<leader>d", ":Lspsaga show_cursor_diagnostics<CR>", opts)
  keymap("n", "<leader>dp", ":Lspsaga diagnostic_jump_prev<CR>", opts)
  keymap("n", "<leader>dn", ":Lspsaga diagnostic_jump_next<CR>", opts)
  keymap("n", "K", ":Lspsaga hover_doc<CR>", opts)
  keymap("n", "<leader>o", ":LSoutlineToggle<CR>", opts)

  if client.name == "tsserver" then
    keymap("n", "<leader>rf", ":TypescriptRenameFile<CR>", opts)
  end
end

local capabilities = cmp_nvim_lsp.default_capabilities()

-- Server setup

lspconfig["bashls"].setup({
  capabilities = capabilities,
  on_attach = on_attach
})

lspconfig["clangd"].setup({
  capabilities = capabilities,
  on_attach = on_attach
})

lspconfig["cmake"].setup({
  capabilities = capabilities,
  on_attach = on_attach
})

lspconfig["cssls"].setup({
  capabilities = capabilities,
  on_attach = on_attach
})

--[[ lspconfig["gopls"].setup({
  capabilities = capabilities,
  on_attach = on_attach
}) ]]

lspconfig["gradle_ls"].setup({
  capabilities = capabilities,
  on_attach = on_attach
})

lspconfig["html"].setup({
  capabilities = capabilities,
  on_attach = on_attach
})

--[[ lspconfig["hls"].setup({
  capabilities = capabilities,
  on_attach = on_attach
}) ]]

lspconfig["jsonls"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
  init_options = {
    provideFormatter = false
  },
  settings = {
    json = {
      schemas = schemastore.json.schemas()
    }
  }
})

lspconfig["tsserver"].setup({
  capabilities = capabilities,
  on_attach = on_attach
})

--[[ lspconfig["kotlin_language_server"].setup({
  capabilities = capabilities,
  on_attach = on_attach
}) ]]

lspconfig["sumneko_lua"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    Lua = {
      diagnostics ={
        globals = { "vim" }
      },
      workspace = {
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.stdpath("config") .. "/lua"] = true,
        }
      }
    }
  }
})

--[[ lspconfig["jedi_language_server"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
}) ]]

--[[ lspconfig["rust_analyser"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
}) ]]

lspconfig["sqls"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

--[[ lspconfig["svelte"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
}) ]]

lspconfig["tailwindcss"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

--[[ lspconfig["volar"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
}) ]]

lspconfig["yamlls"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
  yaml = {
    schemaStore = {
      enable = true
    }
  }
})

typescript.setup({
  server = {
    capabilities = capabilities,
    on_attach = on_attach
  }
})

