vim.api.nvim_create_user_command("TortoiseGit", function(args)
    vim.system({ "TortoiseGitProc", "-command", args.args })
end, {
    nargs = 1,
    complete = function()
        return {
            "branch",
            "clone",
            "commit",
            "fetch",
            "log",
            "pull",
            "push",
            "rebase",
            "reflog",
            "settings",
            "switch",
            "tag",
        }
    end,
    desc = "TortoiseGit commands",
})
