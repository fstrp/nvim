---@module 'lazy.core.plugin'
---@type LazySpec
return {
    "folke/lazydev.nvim",
    ft = "lua",
    version = "*",
    ---@module 'lazydev'
    ---@type lazydev.Config
    opts = {
        library = {
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        },
    },
}
