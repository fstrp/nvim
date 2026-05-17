vim.api.nvim_create_user_command("PackUp", function()
    vim.pack.update()
end, { desc = "Update vim.pack plugins" })

vim.api.nvim_create_user_command("PackRestore", function()
    vim.pack.update(nil, { force = true, target = "lockfile" })
end, { desc = "Restore vim.pack plugins to lockfile version" })

vim.api.nvim_create_user_command("Utree", function()
    vim.cmd.packadd("nvim.undotree")
    vim.cmd.Undotree()
end, { desc = "Show Undotree" })

vim.api.nvim_create_user_command("ToggleTreesitter", function()
    local isRunning = vim.treesitter.highlighter.active[vim.api.nvim_get_current_buf()] ~= nil
    if isRunning then
        vim.treesitter.stop()
    else
        vim.treesitter.start()
    end
end, { desc = "Toggle Treesitter highlighting" })

vim.api.nvim_create_user_command("ToggleCodeLens", function()
    vim.lsp.codelens.enable(not vim.lsp.codelens.is_enabled())
end, { desc = "Toggle LSP CodeLens (reference count, etc.)" })

vim.api.nvim_create_user_command("ToggleDiagnosticVirtualLines", function()
    local new_config = not vim.diagnostic.config().virtual_lines
    vim.diagnostic.config({ virtual_lines = new_config })
end, { desc = "Toggle diagnostics in virtual lines" })
