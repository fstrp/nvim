---@module 'lazy.core.plugin'
---@type LazySpec
return {
    "seblyng/roslyn.nvim",
    ft = "cs",
    enabled = not vim.o.diff,
    ---@module 'roslyn.config'
    ---@type RoslynNvimConfig
    opts = {},
}
