--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("opt")
require("keymap")

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	spec = {
		{ import = "plugins" },
	},
	ui = {
		border = "rounded",
	},
	change_detection = {
		notify = false,
	},
	rocks = {
		enabled = false,
	},
	git = {
		throttle = {
			enabled = true,
			rate = 10,
			duration = 1000, -- ms
		},
	},
	---@diagnostic disable-next-line: assign-type-mismatch
	dev = {
		path = "~/source",
		patterns = { "fstrp" },
		fallback = true,
	},
})
