local function destructive_read(exit_code, filename)
    local file_content = nil
    if exit_code == 0 then
        local f = io.open(filename)
        if f then
            file_content = vim.fn.fnameescape(f:read("*l"))
            f:close()
        end
    end
    vim.fs.rm(filename, { force = true })
    return file_content
end

vim.api.nvim_create_user_command("Yazi", function()
    local chooser_file = os.tmpname()
    local cwd_file = os.tmpname()

    local cmd = {
        "yazi",
        "--chooser-file=" .. chooser_file,
        "--cwd-file=" .. cwd_file,
    }

    require("util").term(cmd, function(_, exit_code, _)
        local file = destructive_read(exit_code, chooser_file)
        local cwd = destructive_read(exit_code, cwd_file)

        if file then
            vim.cmd.edit(file)
        elseif cwd then
            vim.cmd.cd(cwd)
        end
    end)
end, { desc = "Open Yazi" })
