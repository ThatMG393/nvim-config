local M = {
	"williamboman/mason.nvim",
	cmd = "Mason",
	event = "BufReadPre",
	dependencies = {
		{
			"williamboman/mason-lspconfig.nvim"
		}
	}
}

function M.config()
	require('mason').setup {
		ui = {
			border = "none",
			icons = {
				package_installed = "◍",
				package_pending = "◍",
				package_uninstalled = "◍",
			}
		},
		log_level = vim.log.levels.INFO,
		max_concurrent_installers = 4,
		PATH = "prepend"
	}

	require('mason-lspconfig').setup {
		ensure_installed = require('settings.languages').lang_servers,
		automatic_installation = true,
	}
end

return M
