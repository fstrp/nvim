if vim.o.diff then
    return
end

vim.pack.add({
    { src = "https://github.com/mistweaverco/kulala.nvim", version = vim.version.range("*") },
})

require("kulala").setup({
    global_keymaps = {
        ["Send request <cr>"] = {
            "<CR>",
            function()
                require("kulala").run()
            end,
            mode = { "n", "v" },
            ft = { "http", "rest" },
        },
        ["Interrupt requests"] = {
            "<C-c>",
            function()
                require("kulala.ui").interrupt_requests()
            end,
            ft = { "http", "rest" },
        },
    },
})
