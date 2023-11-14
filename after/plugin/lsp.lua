local lsp = require("lsp-zero")
lsp.preset("recommended")

lsp.ensure_installed({
  "tsserver",
  "rust_analyzer",
  "pyright",
  "eslint",
  "clangd",
  "gopls",
  "jdtls"
})

-- lsp.on_attach(function(client, bufnr) lsp.default_keymaps({buffer = bufnr}) end)
-- require("lspconfig.configs").parfait = {
--   default_config = {
--     name = "parfait",
--     cmd = {"/Users/drbarlo/Downloads/parfait/parfait-tools/bin/parfait-lsp"},
--     filetypes = {"c", "cpp", "h", "py", "js", "jsx", "ts", "tsx", "go", "java"},
--     root_dir = require("lspconfig.util").root_pattern(".")
--   }
-- }
-- require("lspconfig").parfait.setup({})

-- fix Undefined global "vim"
lsp.configure("lua-language-server", {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" }
      }
    }
  }
})

lsp.configure("rust_analyzer", {
  settings = {
      procMacro = {
        ignored = {
          ["async-trait"] = {"async_trait"},
          ["async-recursion"] = {"async_recursion"},
          ["futures"] = {"select_internal"}
        }
      }
  }
})

local cmp = require("cmp")
local cmp_select = {behavior = cmp.SelectBehavior.Replace}
local cmp_mappings = lsp.defaults.cmp_mappings({
  ["<C-k>"] = cmp.mapping.select_prev_item(),
  ["<C-j>"] = cmp.mapping.select_next_item(),
  ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), {"i", "c"}),
  ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), {"i", "c"}),
  ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), {"i", "c"}),
  ["<C-e>"] = cmp.mapping({
    i = cmp.mapping.abort(),
    c = cmp.mapping.close()
  }),
  ["<Tab>"] = cmp.mapping.confirm({
    select = true,
    behavior = cmp.ConfirmBehavior.Replace
  })
})

cmp_mappings["<Tab>"] = nil
cmp_mappings["<S-Tab>"] = nil

lsp.setup_nvim_cmp({
  mapping = cmp_mappings,
  sources = {
		{name = "nvim_lsp"},
		{name = "nvim_lua"},
		{name = "luasnip"},
		{name = "buffer"},
		{name = "path"}
	},
})

lsp.set_preferences({
  suggest_lsp_servers = false,
  sign_icons = {
    error = "E",
    warn = "W",
    hint = "H",
    info = "I"
  }
})

lsp.setup({})
vim.diagnostic.config({
  virtual_text = false
})

vim.keymap.set("n", "<S-j>", vim.diagnostic.open_float, {silent = true})
