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

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlight" })
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

vim.keymap.set("c", "<tab>", "<C-y>", { silent = true, remap = true }) -- fixes issue with nvim-cmp

vim.keymap.set("n", "<leader>gt", "<cmd>silent !TortoiseGitProc /command:log<CR>", { desc = "TortoiseGit log" })
vim.keymap.set("n", "<leader>gc", "<cmd>silent !TortoiseGitProc /command:commit<CR>", { desc = "TortoiseGit commit" })
vim.keymap.set("n", "<leader>gf", "<cmd>silent !TortoiseGitProc /command:fetch<CR>", { desc = "TortoiseGit fetch" })

vim.keymap.set("n", "¨", "]", { remap = true })
vim.keymap.set("n", "ü", "[", { remap = true })

vim.keymap.set("n", "]q", "<cmd>cnext<CR>zz", { desc = "Move to next Quickfix item" })
vim.keymap.set("n", "[q", "<cmd>cprevious<CR>zz", { desc = "Move to previous Quickfix item" })
vim.keymap.set("n", "]Q", "<cmd>clast<CR>zz", { desc = "Move to last Quickfix item" })
vim.keymap.set("n", "[Q", "<cmd>cfirst<CR>zz", { desc = "Move to first Quickfix item" })

vim.keymap.set("n", "]b", "<cmd>bnext<CR>zz", { desc = "Move to next buffer" })
vim.keymap.set("n", "[b", "<cmd>bprevious<CR>zz", { desc = "Move to previous buffer" })
vim.keymap.set("n", "]B", "<cmd>blast<CR>zz", { desc = "Move to last buffer" })
vim.keymap.set("n", "[B", "<cmd>bfirst<CR>zz", { desc = "Move to first buffer" })

vim.keymap.set("n", "]l", "<cmd>lnext<CR>zz", { desc = "Move to next Loclist item" })
vim.keymap.set("n", "[l", "<cmd>lprevious<CR>zz", { desc = "Move to previous Loclist item" })
vim.keymap.set("n", "]L", "<cmd>llast<CR>zz", { desc = "Move to last Loclist item" })
vim.keymap.set("n", "[L", "<cmd>lfirst<CR>zz", { desc = "Move to first Loclist item" })
