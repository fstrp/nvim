vim.pack.add({
    "https://github.com/nvim-tree/nvim-web-devicons",
    { src = "https://github.com/MeanderingProgrammer/render-markdown.nvim", version = vim.version.range("*") },
})

require("render-markdown").setup({
    code = {
        position = "right",
        width = "block",
        right_pad = 10,
    },
    quote = { repeat_linebreak = true },
    completions = { lsp = { enabled = true } },
    win_options = {
        showbreak = { default = "", rendered = "  " },
        breakindent = { default = false, rendered = true },
        breakindentopt = { default = "", rendered = "" },
    },
    overrides = { buftype = { nofile = { code = { language = false } } } },
})
