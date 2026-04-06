---@type vim.lsp.Config
return {
    ---@module "lspconfig"
    ---@type lspconfig.settings.lua_ls
    settings = {
        Lua = {
            completion = { callSnippet = "Replace" },
            hint = {
                enable = true,
                arrayIndex = "Enable",
                setType = true,
            },
        },
    },
}
