local npairs = require("nvim-autopairs")
require("cmp").event:on("confirm_done", require("nvim-autopairs.completion.cmp").on_confirm_done({}))

-- automatically create a matching symbol if another is made
npairs.setup({
	check_ts = true,
	disable_filetype = {"TelescopePrompt"},
	ts_config = {
		lua = {"string", "source"},
		javascript = {"string", "template_string"}
	},

	fast_wrap = {
		map = "<M-e>",
		chars = {"{", "[", "(", '"', "'"},
		pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
		offset = 0,
		end_key = "$",
		keys = "qwertyuiopzxcvbnmasdfghjkl",
		check_comma = true,
		highlight = "PmenuSel",
		highlight_grey = "LineNr"
	}
})

