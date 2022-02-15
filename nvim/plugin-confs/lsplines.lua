require("lsp_lines").register_lsp_virtual_lines()
-- Disable virtual_text since it's redundant due to lsp_lines.
vim.diagnostic.config({
  virtual_text = false,
})
