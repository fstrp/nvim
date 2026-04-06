vim.api.nvim_create_autocmd("LspProgress", {
    desc = "Display LSP Progress",
    group = vim.api.nvim_create_augroup("custom.lsp-progress", { clear = true }),
    callback = function(ev)
        local value = ev.data.params.value
        vim.api.nvim_echo({ { value.message or "done" } }, false, {
            id = "lsp." .. ev.data.client_id,
            kind = "progress",
            source = "vim.lsp",
            title = value.title,
            status = value.kind ~= "end" and "running" or "success",
            percent = value.percentage,
        })
    end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    group = vim.api.nvim_create_augroup("custom.highlight-yank", { clear = true }),
    callback = function()
        vim.hl.on_yank()
    end,
})

vim.api.nvim_create_autocmd("LspAttach", {
    desc = "LSP keymaps and commands",
    group = vim.api.nvim_create_augroup("custom.lsp-attach", { clear = true }),
    callback = function(event)
        vim.keymap.set(
            "n",
            "gD",
            vim.lsp.buf.declaration,
            { buffer = event.buf, desc = "LSP: " .. "[G]oto [D]eclaration" }
        )

        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
            local highlight_augroup = vim.api.nvim_create_augroup("custom.lsp-highlight", { clear = false })
            vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
                desc = "LSP documentHightlight",
                buffer = event.buf,
                group = highlight_augroup,
                callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
                desc = "LSP clear documentHightlight",
                buffer = event.buf,
                group = highlight_augroup,
                callback = vim.lsp.buf.clear_references,
            })

            vim.api.nvim_create_autocmd("LspDetach", {
                desc = "Clear custom.lsp-hightlight commands",
                group = vim.api.nvim_create_augroup("custom.lsp-detach", { clear = true }),
                callback = function(event2)
                    vim.lsp.buf.clear_references()
                    vim.api.nvim_clear_autocmds({ group = highlight_augroup, buffer = event2.buf })
                end,
            })
        end

        if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
            vim.api.nvim_buf_create_user_command(event.buf, "ToggleInlayHints", function()
                vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
            end, { desc = "Toggle LSP Inlay Hints" })
        end
    end,
})

vim.api.nvim_create_autocmd("PackChanged", {
    desc = "Run plugin-specific setup on update",
    group = vim.api.nvim_create_augroup("custom.pack-changed", { clear = true }),
    callback = function(ev)
        local name, kind = ev.data.spec.name, ev.data.kind
        if name == "nvim-treesitter" and kind == "update" then
            if not ev.data.active then
                vim.cmd.packadd("nvim-treesitter")
            end
            vim.cmd("TSUpdate")
        end
        if name == "telescope-fzf-native" then
            vim.system({ "make" }, { cwd = ev.data.path })
        end
    end,
})
