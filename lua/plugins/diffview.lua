---@module 'lazy.core.plugin'
---@type LazySpec
return {
    "sindrets/diffview.nvim",
    config = function(_, _)
        local actions = require("diffview.actions")
        require("diffview").setup({
            keymaps = {
                diff4 = {
                    -- Mappings in 4-way diff layouts
                    {
                        { "n", "x" },
                        "<leader>2",
                        actions.diffget("base"),
                        { desc = "Obtain the diff hunk from the BASE version of the file" },
                    },
                    {
                        { "n", "x" },
                        "<leader>1",
                        actions.diffget("ours"),
                        { desc = "Obtain the diff hunk from the OURS version of the file" },
                    },
                    {
                        { "n", "x" },
                        "<leader>3",
                        actions.diffget("theirs"),
                        { desc = "Obtain the diff hunk from the THEIRS version of the file" },
                    },
                },
            },
            view = {
                merge_tool = {
                    layout = "diff4_mixed",
                },
                default = { disable_diagnostics = true },
                file_history = { disable_diagnostics = true },
            },
            hooks = {
                diff_buf_read = function(_)
                    vim.opt_local.relativenumber = false
                end,
            },
        })
    end,
    keys = {
        { "<leader>gl", "<cmd>DiffviewFileHistory<Cr>", mode = "n", desc = "[G]it [Log]" },
        { "<leader>gfl", "<cmd>DiffviewFileHistory % -f<Cr>", mode = "n", desc = "[G]it [F]ile [L]og" },
        { "<leader>gd", "<cmd>DiffviewOpen<Cr>", mode = "n", desc = "[G]it [D]iff" },
        { "<leader>gq", "<cmd>DiffviewClose<Cr>", mode = "n", desc = "[G]it [Q]uit" },
    },
}
