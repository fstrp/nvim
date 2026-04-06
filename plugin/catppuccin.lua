vim.pack.add({
    { src = "https://github.com/catppuccin/nvim", version = vim.version.range("*"), name = "catppuccin" },
})

require("catppuccin").setup({
    term_colors = vim.g.neovide,
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
})

vim.cmd.colorscheme("catppuccin-nvim")
