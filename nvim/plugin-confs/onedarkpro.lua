local onedarkpro = require("onedarkpro")
onedarkpro.setup({
  -- Theme can be overwritten with 'onedark' or 'onelight' as a string!
  -- theme = function()
  --   if vim.o.background == "dark" then
  --     return "onedark"
  --   else
  --     return "onelight"
  --   end
  -- end,
  theme = "onedark",
  colors = {}, -- Override default colors. Can specify colors for "onelight" or "onedark" themes by passing in a table
  hlgroups = {}, -- Override default highlight groups
  plugins = { -- Override which plugins highlight groups are loaded
      native_lsp = true,
      polygot = true,
      treesitter = true,
      -- Others omitted for brevity
  },
  styles = {
    comments = "italic",
    functions = "bold",
    keywords = "bold,italic",
    strings = "italic",
    variables = "bold"
  },
  options = {
      bold = true, -- Use the themes opinionated bold styles?
      italic = true, -- Use the themes opinionated italic styles?
      underline = false, -- Use the themes opinionated underline styles?
      undercurl = false, -- Use the themes opinionated undercurl styles?
      cursorline = false, -- Use cursorline highlighting?
      transparency = false, -- Use a transparent background?
      terminal_colors = true, -- Use the theme's colors for Neovim's :terminal?
      window_unfocussed_color = false, -- When the window is out of focus, change the normal background?
  }
})
onedarkpro.load()
