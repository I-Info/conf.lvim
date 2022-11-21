-- leader
lvim.leader = "space"

vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")
lvim.keys.normal_mode["<A-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<A-h>"] = ":BufferLineCyclePrev<CR>"
lvim.keys.normal_mode[",b"] = ":BufferLinePick<CR>"

vim.keymap.set({ 'n', 'v' }, ',l', require("user.leap").leap_to_line)
vim.keymap.set({ 'n', 'i', 'v' }, '<C-s>', require("user.leap").leap_bidirectional)

vim.keymap.set({ 'i' }, '<C-b>', lvim.builtin.cmp.mapping["<C-Space>"])

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
-- local _, actions = pcall(require, "telescope.actions")
-- lvim.builtin.telescope.defaults.mappings = {
--   -- for input mode
--   i = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--     ["<C-n>"] = actions.cycle_history_next,
--     ["<C-p>"] = actions.cycle_history_prev,
--   },
--   -- for normal mode
--   n = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--   },
-- }
