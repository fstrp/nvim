return {
	"drybalka/tree-climber.nvim",
	config = function()
		local keyopts = { noremap = true, silent = true }
		vim.keymap.set({ "n", "v", "o" }, "<C-h>", function()
			require("tree-climber").goto_parent({ highlight = true })
		end, keyopts)
		vim.keymap.set({ "n", "v", "o" }, "<C-l>", function()
			require("tree-climber").goto_child({ highlight = true })
		end, keyopts)
		vim.keymap.set({ "n", "v", "o" }, "<C-j>", function()
			require("tree-climber").goto_next({ highlight = true })
		end, keyopts)
		vim.keymap.set({ "n", "v", "o" }, "<C-k>", function()
			require("tree-climber").goto_prev({ highlight = true })
		end, keyopts)
		vim.keymap.set({ "v", "o" }, "in", require("tree-climber").select_node, keyopts)
		vim.keymap.set("n", "<a-k>", require("tree-climber").swap_prev, keyopts)
		vim.keymap.set("n", "<a-j>", require("tree-climber").swap_next, keyopts)
		vim.keymap.set("n", "<a-h>", require("tree-climber").highlight_node, keyopts)
	end,
}
