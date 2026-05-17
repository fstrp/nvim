vim.api.nvim_create_user_command("LazyGit", function()
    require("util").term("lazygit")
end, { desc = "Open LazyGit" })
