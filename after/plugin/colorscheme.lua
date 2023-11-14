require("catppuccin").setup({
  flavour = "frappe",
  transparent_background = true,
  show_end_of_buffer = true,
  integrations = {
    bufferline = true,
    cmp = true,
    gitsigns = true,
    nvimtree = false,
    treesitter = true,
    treesitter_context = true,
    telescope = true,
    which_key = true
  }
})

vim.cmd.colorscheme("catppuccin")

