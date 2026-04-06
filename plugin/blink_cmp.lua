vim.pack.add({
    "https://github.com/rafamadriz/friendly-snippets",
    { src = "https://github.com/saghen/blink.cmp", version = vim.version.range("1.*") },
})

require("blink.cmp").setup({
    keymap = {
        preset = "default",
        ["<tab>"] = { "select_and_accept", "fallback" },
        ["<c-l>"] = { "snippet_forward" },
        ["<c-h>"] = { "snippet_backward" },
    },
    cmdline = {
        keymap = { preset = "inherit" },
        completion = { menu = { auto_show = true } },
    },
    appearance = { nerd_font_variant = "normal" },
    sources = {
        default = { "lsp", "path", "snippets" },
        providers = {
            snippets = {
                score_offset = 2,
                min_keyword_length = 3,
            },
            path = { score_offset = 1 },
        },
    },
    completion = {
        accept = { create_undo_point = false },
        ghost_text = { enabled = true },
        documentation = { auto_show = true, auto_show_delay_ms = 0 },
        list = {
            selection = {
                preselect = false,
                auto_insert = false,
            },
        },
    },
    signature = { enabled = true },
    fuzzy = { frecency = { enabled = false } },
})
