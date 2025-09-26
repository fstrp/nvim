---@module 'lazy.core.plugin'
---@type LazySpec
return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	version = "*",
	cmd = { "ConformInfo" },
	keys = {
		{
			"<c-s>",
			function()
				require("conform").format({ async = false, lsp_format = "fallback" })
				vim.cmd("write")
			end,
			mode = { "n", "v" },
			desc = "Format and Save",
		},
		{
			"<leader>f",
			function()
				require("conform").format({ async = true, lsp_format = "fallback" })
			end,
			mode = "n",
			desc = "[F]ormat buffer",
		},
	},
	---@module 'conform.types'
	---@type conform.setupOpts
	opts = {
		notify_on_error = false,
		formatters_by_ft = {
			lua = { "stylua" },
		},
	},
}
