vim.pack.add({
    "https://github.com/nvim-tree/nvim-web-devicons",
    { src = "https://github.com/stevearc/oil.nvim" },
})

require("oil").setup({
    keymaps = {
        ["<C-s>"] = false,
        ["<Esc><Esc>"] = "actions.close",
    },
})
