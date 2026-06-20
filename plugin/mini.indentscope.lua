vim.pack.add({
    { src = "https://github.com/nvim-mini/mini.indentscope", version = "stable" },
})

require("mini.indentscope").setup({
    draw = {
        delay = 0,
        animation = require("mini.indentscope").gen_animation.none(),
    },
    options = {
        indent_at_cursor = false,
        n_lines = 1000,
        try_as_border = true,
    },
    symbol = "▏",
})

vim.api.nvim_create_autocmd("FileType", {
    desc = "Disable mini.indentscope",
    group = vim.api.nvim_create_augroup("custom.disable-mini.indentscope", { clear = true }),
    pattern = { "neo-tree", "mason" },
    callback = function(args)
        vim.b[args.buf].miniindentscope_disable = true
    end,
})
