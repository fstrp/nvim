vim.pack.add({
    { src = "https://github.com/sindrets/diffview.nvim" },
})

require("diffview").setup({
    keymaps = {
        diff4 = {
            -- Mappings in 4-way diff layouts
            {
                { "n", "x" },
                "<leader>2",
                function()
                    require("diffview.actions").diffget("base")()
                end,
                { desc = "Obtain the diff hunk from the BASE version of the file" },
            },
            {
                { "n", "x" },
                "<leader>1",
                function()
                    require("diffview.actions").diffget("ours")()
                end,
                { desc = "Obtain the diff hunk from the OURS version of the file" },
            },
            {
                { "n", "x" },
                "<leader>3",
                function()
                    require("diffview.actions").diffget("theirs")()
                end,
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

vim.keymap.set("n", "<leader>gl", "<cmd>DiffviewFileHistory<Cr>", { desc = "[G]it [Log]" })
vim.keymap.set("n", "<leader>gfl", "<cmd>DiffviewFileHistory % -f<Cr>", { desc = "[G]it [F]ile [L]og" })
vim.keymap.set("n", "<leader>gd", "<cmd>DiffviewOpen<Cr>", { desc = "[G]it [D]iff" })
vim.keymap.set("n", "<leader>gq", "<cmd>DiffviewClose<Cr>", { desc = "[G]it [Q]uit" })
