---@module 'lazy.core.plugin'
---@type LazySpec
return {
    "catppuccin/nvim",
    name = "catppuccin",
    version = "*",
    priority = 1000, -- Make sure to load this before all the other start plugins.
    ---@type CatppuccinOptions
    ---@diagnostic disable-next-line: missing-fields
    opts = {
        integrations = {
            diffview = true,
            mason = true,
            blink_cmp = true,
        },
        custom_highlights = function(colors)
            local c = require("catppuccin.utils.colors")
            return {
                DiffAdd = { bg = c.darken(colors.green, 0.25, colors.base) }, -- default: 0.18
                DiffChange = { bg = c.darken(colors.blue, 0.25, colors.base) }, -- default: 0.07
                DiffDelete = { bg = c.darken(colors.red, 0.25, colors.base) }, -- default: 0.18
                DiffText = { bg = c.darken(colors.blue, 0.45, colors.base) }, -- default: 0.30, needs to be higher than DiffChange
            }
        end,
    },
    init = function()
        vim.cmd.colorscheme("catppuccin")
    end,
}
