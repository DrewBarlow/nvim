local cmp = require("cmp")
require("luasnip/loaders/from_vscode").lazy_load()

local check_backspace = function()
	local col = vim.fn.col(".") - 1
	return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
end

-- autocomplete
cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end
	},

	mapping = cmp.mapping.preset.insert({
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
	}),

	formatting = {
		fields = {"kind", "abbr", "menu"},
		format = function(entry, vim_item)
			vim_item.menu = ({
				nvim_lsp = "",
				nvim_lua = "",
				luasnip = "",
				buffer = "",
				path = "",
				emoji = "",
			})[entry.source.name]
			return vim_item
		end
	},

	sources = {
    {name = "copilot"},
		{name = "nvim_lsp"},
		{name = "nvim_lua"},
		{name = "luasnip"},
		{name = "buffer"},
		{name = "path"}
	},

	confirm_opts = {
		behavior = cmp.ConfirmBehavior.Replace,
		select = false
	},

	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered()
	}
})
