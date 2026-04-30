if vim.o.diff then
    return
end

vim.pack.add({
    { src = "https://github.com/folke/lazydev.nvim", version = vim.version.range("*") },
})

require("lazydev").setup()
