local keymap = vim.keymap.set
local silentopts = { silent = true }

-- Easier, simpler, split nav with ctrl hjkl instea of ctrl-w hjkl
keymap("n", "<C-h>", "<C-w>h", silentops)
keymap("n", "<C-j>", "<C-w>j", silentops)
keymap("n", "<C-k>", "<C-w>k", silentops)
keymap("n", "<C-l>", "<C-w>l", silentops)
keymap("n", "<leader>w", "<C-w>v<C-w>l", silentops)

-- TODO: close current buffer
-- TODO: close all except current buffer

