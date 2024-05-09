-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua

-- Make background transparent
vim.cmd([[
  autocmd VimEnter * hi Normal guibg=NONE ctermbg=NONE
  autocmd VimEnter * hi NonText guibg=NONE ctermbg=NONE
]])

-- Neo-tree specific transparency settings
vim.cmd([[
  autocmd VimEnter * hi NeoTreeNormal guibg=NONE ctermbg=NONE
  autocmd VimEnter * hi NeoTreeNormalNC guibg=NONE ctermbg=NONE
]])

-- Set the active window background to transparent
vim.cmd([[
  autocmd VimEnter * hi Normal guibg=NONE ctermbg=NONE
]])

-- Set the inactive window background to transparent
vim.cmd([[
  autocmd VimEnter * hi NormalNC guibg=NONE ctermbg=NONE
]])

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.yaml", "*.yml" },
  callback = function()
    vim.bo.filetype = "yaml"
  end,
})
