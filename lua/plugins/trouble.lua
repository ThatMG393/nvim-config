local M = {
	"folke/trouble.nvim",
	lazy = false,
	dependencies = {
		{
			"nvim-tree/nvim-web-devicons"
		}
	}
}

function M.config()
	require("trouble").setup { }
end

return M
