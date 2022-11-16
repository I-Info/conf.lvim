vim.api.nvim_create_autocmd('ColorScheme', {
  callback = function()
    require("user.leap").leap_highlight()
  end
})

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- vim.api.nvim_create_autocmd("BufEnter", {
--   pattern = { "*.json", "*.jsonc" },
--   -- enable wrap mode for json files only
--   command = "setlocal wrap",
-- })
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "zsh",
--   callback = function()
--     -- let treesitter use bash highlight for zsh files as well
--     require("nvim-treesitter.highlight").attach(0, "bash")
--   end,
-- })
-- au InsertLeave * if !exists('b:visual_multi') | silent! update | endif
-- vim.api.nvim_create_autocmd("InsertLeave", {
--   pattern = { "*" },
--   command = "if !exists('b:visual_multi') | silent! update | endif",
-- })
