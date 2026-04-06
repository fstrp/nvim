if vim.o.diff then
    return
end

vim.pack.add({
    { src = "https://github.com/neovim/nvim-lspconfig", version = vim.version.range("*") },
    { src = "https://github.com/mason-org/mason.nvim", version = vim.version.range("*") },
    { src = "https://github.com/mason-org/mason-lspconfig.nvim", version = vim.version.range("*") },
    { src = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim" },
})

require("mason").setup({
    registries = {
        "github:mason-org/mason-registry",
        "github:Crashdummyy/mason-registry",
    },
})

require("mason-lspconfig").setup()

require("mason-tool-installer").setup({
    ensure_installed = { "tree-sitter-cli", "lua_ls", "stylua", "json-lsp" },
})
