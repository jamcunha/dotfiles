local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then return end

local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then return end

local lspkind_status_ok, lspkind = pcall(require, "lspkind")
if not lspkind_status_ok then return end

require("luasnip/loaders/from_vscode").lazy_load()

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-k>"] = cmp.mapping.select_prev_item(),
    ["<C-j>"] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ["<C-c>"] = cmp.mapping {
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    },
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
    { name = "nvim_lsp" }, -- LSP
    { name = "nvim_lua" }, -- Nvim lua API
    { name = "luasnip" }, -- Snippet
    { name = "buffer" }, -- Text within current buffer
    { name = "path" }, -- File system paths
  }),
  formatting = {
    format = lspkind.cmp_format({
      max_width = 50,
      ellipsis_char = "...",
    })
  }
})

