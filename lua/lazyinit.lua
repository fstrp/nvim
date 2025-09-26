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
