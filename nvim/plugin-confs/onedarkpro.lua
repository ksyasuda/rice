local onedarkpro = require("onedarkpro")
onedarkpro.setup({
  theme = "onedark",
  -- colors = {}, -- Override default colors. Can specify colors for "onelight" or "onedark" themes by passing in a table
  -- hlgroups = {}, -- Override default highlight groups
  plugins = { -- Override which plugins highlight groups are loaded
      native_lsp = true,
      polygot = true,
      treesitter = true,
  },
  styles = {
    comments = "italic",
    functions = "italic,bold",
    keywords = "italic,bold",
    strings = "NONE",
    variables = "bold"
  },
  options = {
      bold = true, -- Use the themes opinionated bold styles?
      italic = true, -- Use the themes opinionated italic styles?
      underline = true, -- Use the themes opinionated underline styles?
      undercurl = false, -- Use the themes opinionated undercurl styles?
      cursorline = true, -- Use cursorline highlighting?
      transparency = false, -- Use a transparent background?
      terminal_colors = false, -- Use the theme's colors for Neovim's :terminal?
      window_unfocussed_color = false, -- When the window is out of focus, change the normal background?
  }
})
onedarkpro.load()
