local hide_in_width = function()
  return vim.fn.winwidth(0) > 80
end

-- bar at the bottom of the screen
local branch = {
  "branch",
  icon = {"B"}
}

local diagnostics = {
  "diagnostics",
  sources = {"nvim_diagnostic"},
  sections = {"error", "warn"},
  symbols = {error = "E ", warn = " W "},
  colored = true,
  always_visible = true,
}

local diff = {
  "diff",
  symbols = {added = "+", modified = "*", removed = "-"},
  cond = hide_in_width,
  colored = true,
  always_visible = true
}

local filetype = {
  "filetype",
  icons_enabled = true
}

local location = {
  "location",
  padding = 0
}

local spaces = function()
  return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
end

require("lualine").setup {
  options = {
    globalstatus = true,
    icons_enabled = true,
    theme = "auto",
    component_separators = {left = "", right = "|"},
    section_separators = {left = "", right = ""},
    disabled_filetypes = {"alpha", "dashboard"},
    always_divide_middle = true
  },

  sections = {
    lualine_a = {"mode"},
    lualine_b = {branch},
    lualine_c = {diagnostics},
    lualine_x = {diff, "encoding", filetype},
    lualine_y = {"progress"},
    lualine_z = {location}
  }
}
