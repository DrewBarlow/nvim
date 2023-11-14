local which_key = require("which-key")

local setup = {
  plugins = {
    marks = false,
    registers = false,
    spelling = {
      enabled = false,
      suggestions = 20
    },

    presets = {
      operators = false,
      motions = false,
      text_objects = false,
      windows = false,
      nav = false,
      z = false,
      g = false
    }
  },
  
  icons = {
    breadcrumb = "»",
    separator = "➜",
    group = "+"
  },

  popup_mappings = {
    scroll_down = "<c-d>",
    scroll_up = "<c-u>"
  },

  window = {
    border = "rounded",
    position = "bottom",
    margin = {1, 0, 1, 0},
    padding = {2, 2, 2, 2},
    winblend = 0
  },

  layout = {
    height = {min = 4, max = 25},
    width = {min = 20, max = 50},
    spacing = 3,
    align = "left"
  },

  ignore_missing = true,
  hidden = {"<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ "},
  show_help = true,
  triggers = "auto",
  triggers_blacklist = {
    i = {"j", "k"},
    v = {"j", "k"}
  }
}

local opts = {
  mode = "n",
  prefix = "<leader>",
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = true
}

local mappings = {
  g = {
    name = "Git",
    g = {"<cmd>lua _LAZYGIT_TOGGLE()<CR>", "Lazygit"},
    j = {"<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk"},
    k = {"<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk"},
    l = {"<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame"},
    c = {"<cmd>Telescope git_commits<cr>", "See Commits"},
    b = {"<cmd>Telescope git_branches<cr>", "See Branches"},
    d = {"<cmd>Gitsigns diffthis HEAD<cr>", "Diff"}
  },

  l = {
    name = "LSP",
    d = {
      name = "Diagnostics",
      d = {"<cmd>Telescope diagnostics<cr>", "Workspace Diagnostics"},
      j = {"<cmd>lua vim.diagnostic.goto_next({severity = vim.diagnostic.severity.ERROR})<cr>", "Goto Next Error"},
      k = {"<cmd>lua vim.diagnostic.goto_prev({severity = vim.diagnostic.severity.ERROR})<cr>", "Goto Previous Error"},
      q = {"<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action"}
    },

    s = {
      name = "Source",
      s = {"<cmd>lua vim.lsp.buf.hover()<cr>", "Signature Help"},
      r = {"<cmd>Telescope lsp_references<cr>", "Show References"},
      t = {"<cmd>Telescope lsp_type_definitions<cr>", "Type Definitions"},
      d = {"<cmd>lua vim.lsp.buf.definition()<cr>", "Go To Definition"},
      i = {"<cmd>lua require('goto-preview').goto_preview_implementation()<cr>", "Show Implementation"},
      n = {"<cmd>lua vim.lsp.buf.rename()<cr>", "Rename"}
    },

    f = {"<cmd>lua vim.lsp.buf.format{async=true}<cr>", "Format"},
    l = {"<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action"},
    o = {"<cmd>lua vim.lsp.buf.outgoing_calls()<cr>", "Outgoing Calls"},
    i = {"<cmd>lua vim.lsp.buf.incoming_calls()<cr>", "Incoming Calls"}
  },

  s = {
    name = "Search",
    k = {"<cmd>Telescope keymaps<cr>", "Keymaps"},
    g = {"<cmd>Telescope live_grep theme=ivy<cr>", "Live Grep"},
    b = {"<cmd>lua require('telescope.builtin').buffers({})<cr>", "Show Buffers"},
    f = {
      "<cmd>lua require('telescope').extensions.file_browser.file_browser({respect_gitignore=false, hidden=true, grouped=true, initial_mode='insert'})<cr>",
      "File Search"
    }
  },

  t = {
    name = "Terminal",
    f = {"<cmd>ToggleTerm direction=float<cr>", "Float"},
    h = {"<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal"},
    v = {"<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical"}
  },

  m = {
    name = "Misc.",
    u = {"<cmd>UndotreeToggle<cr>", "Undo Tree"},
    r = {[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], "Replace Hovering"},
    R = {"<cmd>so<cr>", "Reload Vim"},
  }
}

which_key.setup(setup)
which_key.register(mappings, opts)
