---@module 'lazy.core.plugin'
---@type LazySpec
return {
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {},
	enabled = false,
	config = function()
		local fzf = require("fzf-lua")
		fzf.register_ui_select({})
		vim.keymap.set("n", "<leader>sh", fzf.helptags, { desc = "[S]earch [H]elp" })
		vim.keymap.set("n", "<leader>sk", fzf.keymaps, { desc = "[S]earch [K]eymaps" })
		vim.keymap.set("n", "<leader>sf", fzf.files, { desc = "[S]earch [F]iles" })
		vim.keymap.set("n", "<leader>ss", fzf.builtin, { desc = "[S]earch [S]eachables" })
		vim.keymap.set("n", "<leader>sw", fzf.grep_cword, { desc = "[S]earch current [W]ord" })
		vim.keymap.set("n", "<leader>sg", fzf.live_grep, { desc = "[S]earch by [G]rep" })
		vim.keymap.set("n", "<leader>sd", fzf.diagnostics_workspace, { desc = "[S]earch [D]iagnostics" })
		vim.keymap.set("n", "<leader>sr", fzf.resume, { desc = "[S]earch [R]esume" })
		vim.keymap.set("n", "<leader>s.", fzf.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
		vim.keymap.set("n", "<leader>sb", fzf.buffers, { desc = "[S]earch existing [B]uffers" })
		vim.keymap.set("n", "<leader>sq", fzf.quickfix, { desc = "[S]earch [Q]uickfix list" })
		vim.keymap.set("n", "<leader>sl", fzf.loclist, { desc = "[S]earch [L]oclist" })
		vim.keymap.set("n", "<leader>/", fzf.blines, { desc = "[/] Fuzzily search in current buffer" })

		vim.keymap.set("n", "<leader>sn", function()
			fzf.files({ cwd = vim.fn.stdpath("config") })
		end, { desc = "[S]earch [N]eovim files" })

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("telescope-lsp-attach", { clear = true }),
			callback = function(event)
				vim.keymap.set(
					"n",
					"gd",
					require("fzf-lua").lsp_definitions,
					{ buffer = event.buf, desc = "LSP:[G]oto [D]efinition" }
				)
			end,
		})
	end,
}
