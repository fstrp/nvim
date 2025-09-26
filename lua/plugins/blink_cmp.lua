---@module 'lazy.core.plugin'
---@type LazySpec
return {
	"saghen/blink.cmp",
	dependencies = "rafamadriz/friendly-snippets",
	version = "*",
	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
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
			documentation = { auto_show = true },
		},
		signature = { enabled = true },
		fuzzy = { use_frecency = false },
	},
	opts_extend = { "sources.default" },
}
