---@module 'lazy.core.plugin'
---@type LazySpec
return {
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	dependencies = {
		{
			"williamboman/mason-lspconfig.nvim",
			opts = {},
			dependencies = {
				{
					"williamboman/mason.nvim",
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
