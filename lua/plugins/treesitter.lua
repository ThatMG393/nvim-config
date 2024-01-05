local M = {
	"nvim-treesitter/nvim-treesitter",
	event = "BufReadPost",
	dependencies = {
		{
			"nvim-tree/nvim-web-devicons"
		},
		{
			"JoosepAlviste/nvim-ts-context-commentstring",
			event = "VeryLazy",
		}
	}
}

function M.config()	
	require('nvim-treesitter.configs').setup {
		ensure_installed = require('settings.languages').langs,
		highlight = {
			enabled = true,
			disable = { "css" }
		},
		autopairs = {
			enabled = true,
		},
		indent = {
			enabled = true,
			disable = { "python", "css" }
		},
		sync_install = false
	}

	vim.g.skip_ts_context_commentstring_module = true
	require('ts_context_commentstring').setup {}
end

return M
