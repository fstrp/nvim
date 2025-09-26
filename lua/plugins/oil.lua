return {
	"stevearc/oil.nvim",
	---@module 'oil'
	---@type oil.SetupOpts
	opts = {
		keymaps = {
			["<C-s>"] = false,
			["<C-h>"] = false,
			["<C-t>"] = false,
			["<C-c>"] = false,
			["<Esc><Esc>"] = "actions.close",
			["<C-l>"] = false,
		},
	},
	dependencies = { "nvim-tree/nvim-web-devicons" },
}
