local lsp = require("lsp-zero").preset({
  -- manage_nvim_cmp = {
  --   set_sources = "recommended"
  -- }
})

lsp.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp.default_keymaps({buffer = bufnr})

  local opts = { buffer = bufnr, remap = false }

  vim.keymap.set("n", "gd", function() vim.lsp.buf.defenition() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "<leader>dp", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>dn", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>rr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

lsp.ensure_installed({
  "tsserver",
  "eslint",
  "rust_analyzer",
  "bashls",
  "clangd",
  "gopls",
  "lua_ls",
  "intelephense",
  "pyright",
  "sqlls",
  "tailwindcss",
})

-- (Optional) Configure lua language server for neovim
require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()

local cmp = require("cmp")
local cmp_select = { cmp.SelectBehavior.Select }

require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup({
  sources = {
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "nvim_lua" },
    { name = "buffer" },
  },
  mapping = {
    ["<C-k>"] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_prev_item(cmp_select)
      else
        cmp.complete()
      end
    end),
    ["<C-j>"] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_next_item(cmp_select)
      else
        cmp.complete()
      end
    end),
    ["<CR>"] = cmp.mapping.confirm({ select = false }),
    ["<C-Space>"] = cmp.mapping.complete(),
  }
})
