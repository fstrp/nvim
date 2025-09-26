---@module 'lazy.core.plugin'
---@type LazySpec
return {
	"MeanderingProgrammer/render-markdown.nvim",
	dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
	version = "*",
	ft = { "markdown", "quarto" },
	---@module 'render-markdown'
	---@type render.md.UserConfig
	opts = {
		code = {
			position = "right",
			width = "block",
			right_pad = 10,
		},
		quote = { repeat_linebreak = true },
		completions = { lsp = { enabled = true } },
		win_options = {
			showbreak = { default = "", rendered = "  " },
			breakindent = { default = false, rendered = true },
			breakindentopt = { default = "", rendered = "" },
		},
	},
}
