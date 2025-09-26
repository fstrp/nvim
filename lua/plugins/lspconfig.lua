---@module 'lazy.core.plugin'
---@type LazySpec
return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{ "williamboman/mason.nvim", opts = {} },
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		-- full list: `:help lspconfig-all`
		---@module "lspconfig.configs"
		---@type table<string, lspconfig.Config>
		---@diagnostic disable: missing-fields
		local servers = {
			lua_ls = {
				settings = {
					Lua = {
						completion = { callSnippet = "Replace" },
						hint = {
							enable = true,
							arrayIndex = "Enable",
							setType = true,
						},
					},
				},
			},
		}
		---@diagnostic enable: missing-fields

		local ensure_installed = vim.tbl_keys(servers or {})
		vim.list_extend(ensure_installed, {
			"stylua", -- Used to format Lua code
		})
		require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

		for server, config in pairs(servers) do
			vim.lsp.config(server, config)
			vim.lsp.enable(server)
		end
	end,
}
