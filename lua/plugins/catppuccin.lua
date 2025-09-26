return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000, -- Make sure to load this before all the other start plugins.
	opts = {
		integrations = {
			diffview = true,
		},
	},
	init = function()
		vim.cmd.colorscheme("catppuccin")
	end,
}
