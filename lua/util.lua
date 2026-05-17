local M = {}

---@param cmd string | table
---@param on_exit fun(job_id: number, exit_code: number, event_type: "exit")?
M.term = function(cmd, on_exit)
    local win_width = math.ceil(vim.o.columns * 0.9)
    local win_height = math.ceil(vim.o.lines * 0.9)

    local term_buf = vim.api.nvim_create_buf(false, true)

    vim.api.nvim_open_win(term_buf, true, {
        style = "minimal",
        relative = "editor",
        width = win_width,
        height = win_height,
        row = math.ceil((vim.o.lines - win_height) / 2 - 1),
        col = math.ceil((vim.o.columns - win_width) / 2),
    })

    vim.fn.jobstart(cmd, {
        term = true,
        on_exit = function(job_id, exit_code, event_type)
            vim.api.nvim_buf_delete(term_buf, {})
            if on_exit then
                on_exit(job_id, exit_code, event_type)
            end
        end,
    })
    vim.cmd.startinsert()
end

return M
