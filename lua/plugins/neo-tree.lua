return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
		"3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
	},
	cmd = "Neotree",
	keys = {
		{ "\\", ":Neotree reveal right<CR>", { desc = "NeoTree reveal" } },
	},
	opts = {
		close_if_last_window = true,
		filesystem = {
			window = {
				mappings = {
					["\\"] = "close_window",
				},
			},
			follow_current_file = {
				enabled = true,
			},
		},
	},
}
