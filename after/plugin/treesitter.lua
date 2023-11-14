local treesitter = require("nvim-treesitter")
local configs = require("nvim-treesitter.configs")

configs.setup({
  ensure_installed = {
    "lua",
    "markdown",
    "markdown_inline",
    "bash",
    "python",
    "lua",
    "html",
    "css",
    "rust",
    "toml",
    "yaml",
    "c",
    "cpp",
    "go",
    "kotlin",
    "java",
    "swift",
    "javascript",
    "typescript"
  },

  -- highlight = {enable = true},
	sync_install = false,
	autopairs = {enable = true},
	indent = {enable = true},
	context_commentstring = {enable = true, enable_autocmd = false},
  autotag = {enable = true}
})

