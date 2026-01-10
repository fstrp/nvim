---@diagnostic disable: missing-fields
---@module 'lspconfig'
---@type lspconfig.Config
return {
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
