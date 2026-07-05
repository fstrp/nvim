vim.pack.add({
    { src = "https://github.com/stevearc/conform.nvim", version = vim.version.range("*") },
})

require("conform").setup({
    notify_on_error = false,
    formatters_by_ft = {
        lua = { "stylua" },
        http = { "kulala-fmt" },
        rest = { "kulala-fmt" },
    },
})

vim.keymap.set({ "n", "v" }, "<C-s>", function()
    require("conform").format({ async = false, lsp_format = "fallback" })
    vim.cmd("write")
end, { desc = "Format and Save" })

vim.keymap.set({ "n", "v" }, "<leader>f", function()
    require("conform").format({ async = true, lsp_format = "fallback" })
end, { desc = "[F]ormat buffer" })
