require 'nvim-tree'.setup {
    disable_netrw       = false,
    hijack_netrw        = false,
    open_on_setup       = false,
    ignore_ft_on_setup  = {},
    -- auto_close          = false,
    open_on_tab         = false,
    hijack_cursor       = false,
    update_cwd          = false,
    -- update_to_buf_dir   = {
    --   enable = true,
    --   auto_open = true,
    -- },
    diagnostics         = {
        enable = true,
        icons = {
            hint = "",
            info = "",
            warning = "",
            error = "",
        }
    },
    update_focused_file = {
        enable      = false,
        update_cwd  = false,
        ignore_list = {}
    },
    system_open         = {
        cmd  = nil,
        args = {}
    },
    filters             = {
        dotfiles = false,
        custom = {}
    },
    git                 = {
        enable = true,
        ignore = true,
        timeout = 500,
    },
    view                = {
        width = 35,
        height = 35,
        hide_root_folder = false,
        side = 'left',
        -- auto_resize = false,
        mappings = {
            custom_only = false,
            list = {}
        },
        number = false,
        relativenumber = false,
        signcolumn = "yes"
    },
    trash               = {
        cmd = "trash",
        require_confirm = true
    },
    actions             = {
        change_dir = {
            global = false,
        },
        open_file = {
            quit_on_open = false,
        }
    }
}

-- local tree_cb = require'nvim-tree.config'.nvim_tree_callback

-- default mappings
local list = {
    { key = { "<CR>", "o", "<2-LeftMouse>" }, action = "edit" },
    { key = { "O" }, action = "edit_no_picker" },
    { key = { "<2-RightMouse>", "<C-]>" }, action = "cd" },
    { key = "<C-v>", action = "vsplit" },
    { key = "<C-x>", action = "split" },
    { key = "<C-t>", action = "tabnew" },
    { key = "<", action = "prev_sibling" },
    { key = ">", action = "next_sibling" },
    { key = "P", action = "parent_node" },
    { key = "<BS>", action = "close_node" },
    { key = "<Tab>", action = "preview" },
    { key = "K", action = "first_sibling" },
    { key = "J", action = "last_sibling" },
    { key = "I", action = "toggle_ignored" },
    { key = "H", action = "toggle_dotfiles" },
    { key = "R", action = "refresh" },
    { key = "a", action = "create" },
    { key = "d", action = "remove" },
    { key = "D", action = "trash" },
    { key = "r", action = "rename" },
    { key = "<C-r>", action = "full_rename" },
    { key = "x", action = "cut" },
    { key = "c", action = "copy" },
    { key = "p", action = "paste" },
    { key = "y", action = "copy_name" },
    { key = "Y", action = "copy_path" },
    { key = "gy", action = "copy_absolute_path" },
    { key = "[c", action = "prev_git_item" },
    { key = "]c", action = "next_git_item" },
    { key = "-", action = "dir_up" },
    { key = "s", action = "system_open" },
    { key = "q", action = "close" },
    { key = "g?", action = "toggle_help" },
}
