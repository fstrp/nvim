vim.pack.add({
    "https://github.com/nvim-treesitter/nvim-treesitter",
    { src = "https://github.com/mistweaverco/kulala.nvim", version = vim.version.range("*") },
})

require("kulala").setup({})
