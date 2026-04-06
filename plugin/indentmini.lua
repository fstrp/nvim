vim.pack.add({
    { src = "https://github.com/nvimdev/indentmini.nvim" },
})

vim.cmd.highlight("IndentLineCurrent guifg=#444444")

require("indentmini").setup({
    enabled = true,
    minlevel = 2,
    only_current = true,
    char = "▏",
})
