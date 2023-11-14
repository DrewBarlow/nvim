-- display for tabs
require("bufferline").setup {
  options = {
    close_command = "Bdelete! %d",
    right_mouse_command = "Bdelete! %d",
    offsets = {{filetype = "NvimTree", text = "", padding = 1}},
    separator_style = "thin"
  },

  highlights = {
    background = {
      fg = {attribute = "fg", highlight = "Normal"},
      bg = {attribute = "bg", highlight = "Normal"}
    },

    buffer_visible = {
      fg = {attribute = "fg", highlight = "Normal"},
      bg = {attribute = "bg", highlight = "Normal"}
    },

    close_button = {
      fg ={ attribute = "fg", highlight = "Normal"},
      bg ={ attribute = "bg", highlight = "Normal"}
    },

    close_button_visible = {
      fg = {attribute = "fg", highlight = "Normal"},
      bg = {attribute = "bg", highlight = "Normal"}
    },
   
    tab_selected = {
      fg = {attribute = "fg", highlight = "NormalSel"},
      bg = {attribute = "bg", highlight = "NormalSel"}
    },

    tab = {
      fg = {attribute = "fg", highlight = "Normal"},
      bg = {attribute = "bg", highlight = "Normal"}
    },

    tab_close = {
      fg = {attribute = "fg", highlight = "NormalSel"},
      bg = {attribute = "bg", highlight = "Normal"}
    },

    duplicate_selected = {
      fg = {attribute = "fg", highlight = "NormalSel"},
      bg = {attribute = "bg", highlight = "NormalSel"},
      italic = true
    },

    duplicate_visible = {
      fg = {attribute = "fg", highlight = "Normal"},
      bg = {attribute = "bg", highlight = "Normal"},
      italic = true
    },

    duplicate = {
      fg = {attribute = "fg", highlight = "Normal"},
      bg = {attribute = "bg", highlight = "Normal"},
      italic = true
    },

    modified = {
      fg = {attribute = "fg", highlight = "Normal"},
      bg = {attribute = "bg", highlight = "Normal"}
    },

    modified_selected = {
      fg = {attribute = "fg", highlight = "Normal"},
      bg = {attribute = "bg", highlight = "Normal"}

    },
    modified_visible = {
      fg = {attribute = "fg", highlight = "Normal"},
      bg = {attribute = "bg", highlight = "Normal"}
    },

    separator = {
      fg = {attribute = "bg", highlight = "Normal"},
      bg = {attribute = "bg", highlight = "Normal"}
    },

    separator_selected = {
      fg = {attribute = "bg", highlight = "Normal"},
      bg = {attribute = "bg", highlight = "Normal"}
    },

    indicator_selected = {
      fg = {attribute = "fg", highlight = "LspDiagnosticsDefaultHint"},
      bg = {attribute = "bg", highlight = "Normal"}
    }
  }
}

