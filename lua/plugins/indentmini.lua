vim.cmd.highlight("IndentLineCurrent guifg=#444444")
return {
    url = "https://github.com/nvimdev/indentmini.nvim",
    opts = {
        enabled = true,
        minlevel = 2,
        only_current = true,
        char = "▏",
    },
}
