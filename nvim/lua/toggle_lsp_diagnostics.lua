local diagnostics_active = true
local toggle_diagnostics = function()
    diagnostics_active = not diagnostics_active
    if diagnostics_active then
        vim.diagnostic.show()
    else
        vim.diagnostic.hide()
    end
end

vim.keymap.set('n', '<leader>td', toggle_diagnostics)
