-- Theme
lvim.colorscheme = "catppuccin"
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "catppuccin",
  callback = function()
    -- Your custom highlights here
    vim.cmd([[highlight LineNr guifg=#7a7a7a]])  -- example darker gray
    vim.cmd([[highlight CursorLineNr guifg=#C0C0C0]])  -- lighter for current line number
  end,
})
