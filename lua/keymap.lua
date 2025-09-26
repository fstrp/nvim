vim.keymap.set({ "n", "v" }, "<C-s>", "<Cmd>w<Cr>", { desc = "[S]ave" })
vim.keymap.set("i", "<C-s>", "<Cmd>w<Cr><Esc>", { desc = "[S]ave" })

vim.keymap.set({ "n", "v" }, "<leader>p", '"0p', { desc = "Paste last yanked" })
vim.keymap.set({ "n", "v" }, "<leader>P", '"0P', { desc = "Paste last yanked before cursor" })

-- <C-v> seems to work without extra keymap
vim.keymap.set("v", "<C-c>", '"*y', { desc = "[C]opy to system [C]lipboard" })

vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selected lines down" })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selected lines up" })
vim.keymap.set("v", "<A-h>", "<gv", { desc = "Unindent" })
vim.keymap.set("v", "<A-l>", ">gv", { desc = "Indent" })

vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
vim.keymap.set("n", "<leader>j", "<cmd>cnext<CR>zz", { desc = "Move to next Quickfix item" })
vim.keymap.set("n", "<leader>k", "<cmd>cprev<CR>zz", { desc = "Move to previous Quickfix item" })

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Window navigation
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })
