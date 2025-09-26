---@module 'lazy.core.plugin'
---@type LazySpec
return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	main = "nvim-treesitter.configs",
	---@module 'nvim-treesitter.configs'
	---@type TSConfig
	---@diagnostic disable-next-line: missing-fields
	opts = {
		ensure_installed = {
			"bash",
			"c",
			"diff",
			"html",
			"lua",
			"luadoc",
			"markdown",
			"markdown_inline",
			"vim",
			"vimdoc",
			"query",
			"gitcommit",
		},
		auto_install = true,
		highlight = { enable = true },
		indent = { enable = true, disable = { "ruby" } },
		incremental_selection = {
			enable = true,
			keymaps = {
				init_selection = "<leader>v",
				node_incremental = "<leader>v",
				scope_incremental = false,
				node_decremental = "<bs>",
			},
		},
	},
}
