---@diagnostic disable: missing-fields
---@module 'lazy.core.plugin'
---@type LazySpec
return {
    "lewis6991/gitsigns.nvim",
    ---@module 'gitsigns.config'
    ---@type Gitsigns.Config
    opts = {
        signs = {
            add = { text = "┃" },
            change = { text = "┃" },
            delete = { text = "_" },
            topdelete = { text = "‾" },
            changedelete = { text = "~" },
            untracked = { text = "┆" },
        },
        on_attach = function(bufnr)
            local gitsigns = require("gitsigns")

            local function map(mode, l, r, opts)
                opts = opts or {}
                opts.buffer = bufnr
                vim.keymap.set(mode, l, r, opts)
            end

            map("n", "]c", function()
                if vim.wo.diff then
                    vim.cmd.normal({ "]c", bang = true })
                else
                    gitsigns.nav_hunk("next")
                end
            end, { desc = "next hunk" })

            map("n", "[c", function()
                if vim.wo.diff then
                    vim.cmd.normal({ "[c", bang = true })
                else
                    gitsigns.nav_hunk("prev")
                end
            end, { desc = "previous hunk" })

            map("n", "<leader>hs", gitsigns.stage_hunk, { desc = "stage hunk" })
            map("n", "<leader>hr", gitsigns.reset_hunk, { desc = "reset hunk" })
            map("n", "<leader>hp", gitsigns.preview_hunk, { desc = "preview hunk" })
            map("n", "<leader>hb", function()
                gitsigns.blame_line({ full = true })
            end, { desc = "blame" })
            map("n", "<leader>tb", gitsigns.toggle_current_line_blame, { desc = "toggle line blame" })

            map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", { desc = "hunk text object" })
        end,
    },
}
