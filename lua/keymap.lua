vim.keymap.set({ "n", "v" }, "<C-s>", "<Cmd>w<Cr>", { desc = "[S]ave" })
vim.keymap.set("i", "<C-s>", "<Cmd>w<Cr><Esc>", { desc = "[S]ave" })

vim.keymap.set({ "n", "x" }, "<leader>p", '"0p', { desc = "Paste last yanked" })
vim.keymap.set({ "n", "x" }, "<leader>P", '"0P', { desc = "Paste last yanked before cursor" })

-- <C-v> seems to work without extra keymap
vim.keymap.set("v", "<C-c>", '"*y', { desc = "[C]opy to system [C]lipboard" })
vim.keymap.set("i", "<C-BS>", "<C-w>", { desc = "Delete Word" })

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlight" })
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

vim.keymap.set("n", "<leader>gt", "<cmd>silent !TortoiseGitProc /command:log<CR>", { desc = "TortoiseGit log" })
vim.keymap.set("n", "<leader>gc", "<cmd>silent !TortoiseGitProc /command:commit<CR>", { desc = "TortoiseGit commit" })
vim.keymap.set("n", "<leader>gf", "<cmd>silent !TortoiseGitProc /command:fetch<CR>", { desc = "TortoiseGit fetch" })

vim.keymap.set("n", "¨", "]", { remap = true })
vim.keymap.set("n", "ü", "[", { remap = true })

vim.keymap.set("n", "gK", function()
	local new_config = not vim.diagnostic.config().virtual_lines
	vim.diagnostic.config({ virtual_lines = new_config })
end, { desc = "Toggle diagnostic virtual_lines" })
