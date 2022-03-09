require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'codedark',
    -- theme = 'dracula',
    -- theme = 'horizon',
    -- theme = 'onedark',
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = ''},
    -- section_separators = { left = '', right = '' },
    disabled_filetypes = {},
    always_divide_middle = true,
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch', 'diff' },
    lualine_c = { 'filename' },
    lualine_x = {
      {
        'diagnostics',
        'fileformat',
        symbols = {
          unix = '', -- e712
          dos = '', -- e70f
          mac = '', -- e711
        }
      }, 'encoding', 'fileformat', { 'filetype', colored = true, icon_only = false } },
    lualine_y = { 'progress' },
    lualine_z = { 'location' }
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {
        {
            'filename',
            file_status = true, -- Displays file status (readonly status, modified status)
            path = 0, -- 0: Just the filename
            shorting_target = 40, -- Shortens path to leave 40 spaces in the window
            symbols = {
                 modified = '[+]', -- Text to show when the file is modified.
                 readonly = '[-]', -- Text to show when the file is non-modifiable or readonly.
                 unnamed = '[No Name]', -- Text to show for unnamed buffers.
            }
        },
    },
    lualine_x = { 'location' },
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = { 'quickfix', 'fzf', 'nvim-tree', 'symbols-outline', 'fugitive' }
}
