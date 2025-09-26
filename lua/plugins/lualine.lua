return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		sections = {
			lualine_x = { "encoding", "fileformat", "filetype", "lsp_status" },
		},
		extensions = { "quickfix", "lazy", "neo-tree", "oil" },
	},
}
