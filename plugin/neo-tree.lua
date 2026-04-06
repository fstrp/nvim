if vim.o.diff then
    return
end

vim.pack.add({
    "https://github.com/nvim-lua/plenary.nvim",
    "https://github.com/nvim-tree/nvim-web-devicons",
    "https://github.com/MunifTanjim/nui.nvim",
    { src = "https://github.com/nvim-neo-tree/neo-tree.nvim", version = vim.version.range("3.*") },
})

require("neo-tree").setup({
    close_if_last_window = true,
    filesystem = {
        follow_current_file = {
            enabled = true,
        },
        filtered_items = {
            hide_by_name = { "bin", "obj" },
        },
    },
})

vim.keymap.set("n", "<leader>e", "<cmd>Neotree reveal right<cr>", { desc = "NeoTree reveal" })
