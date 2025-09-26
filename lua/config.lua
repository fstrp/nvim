vim.diagnostic.config({
	virtual_text = {
		severity = { min = vim.diagnostic.severity.ERROR },
	},
	underline = {
		severity = { min = vim.diagnostic.severity.WARN },
	},
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "",
			[vim.diagnostic.severity.WARN] = "",
			[vim.diagnostic.severity.INFO] = "",
			[vim.diagnostic.severity.HINT] = "",
		},
		numhl = {
			[vim.diagnostic.severity.WARN] = "WarningMsg",
			[vim.diagnostic.severity.ERROR] = "ErrorMsg",
			[vim.diagnostic.severity.INFO] = "DiagnosticInfo",
			[vim.diagnostic.severity.HINT] = "DiagnosticHint",
		},
	},
})
