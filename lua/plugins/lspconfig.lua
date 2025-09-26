---@module 'lazy.core.plugin'
---@type LazySpec
return {
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	dependencies = {
		{
			"mason-org/mason-lspconfig.nvim",
			version = "*",
			opts = {},
			dependencies = {
				{
					"mason-org/mason.nvim",
					version = "*",
					opts = {
						registries = {
							"github:mason-org/mason-registry",
							"github:Crashdummyy/mason-registry",
						},
					},
				},
				{ "neovim/nvim-lspconfig", version = "*" },
			},
		},
	},
	opts = {
		ensure_installed = { "lua_ls", "stylua", "json-lsp" },
	},
}
