vim.pack.add({
    "https://github.com/nvim-tree/nvim-web-devicons",
    { src = "https://github.com/nvim-lualine/lualine.nvim" },
})

require("lualine").setup({
    sections = {
        lualine_x = {
            "encoding",
            "fileformat",
            "filetype",
            "lsp_status",
        },
    },
    extensions = { "quickfix", "neo-tree", "oil" },
})
