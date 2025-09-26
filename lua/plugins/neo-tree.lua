return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	cmd = "Neotree",
	keys = {
		{ "<leader>e", ":Neotree reveal right<CR>", desc = "NeoTree reveal" },
	},
	---@module 'neo-tree.defaults'
	---@type neotree.Config.Base
	---@diagnostic disable-next-line: missing-fields
	opts = {
		close_if_last_window = true,
		filesystem = {
			window = {
				mappings = {
					["<leader>e"] = "close_window",
				},
			},
			follow_current_file = {
				enabled = true,
			},
			filtered_items = {
				hide_by_name = { "bin", "obj" },
			},
		},
	},
}
