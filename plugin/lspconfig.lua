if vim.o.diff then
    return
end

vim.pack.add({
    { src = "https://github.com/neovim/nvim-lspconfig", version = vim.version.range("*") },
    { src = "https://github.com/mason-org/mason.nvim", version = vim.version.range("*") },
})

require("mason").setup({
    registries = {
        "github:mason-org/mason-registry",
        "github:Crashdummyy/mason-registry",
    },
})

local autoInstall = { "tree-sitter-cli", "lua-language-server", "stylua", "json-lsp" }
local registry = require("mason-registry")

for _, package in ipairs(autoInstall) do
    if not registry.is_installed(package) then
        registry.get_package(package):install()
    end
end

vim.lsp.enable({ "lua_ls", "roslyn", "taplo", "stylua", "yamlls", "jsonls" })
