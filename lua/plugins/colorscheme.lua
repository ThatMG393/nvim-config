local M = {
	"martinsione/darkplus.nvim",
	name = "darkplus",
	lazy = false,
	priority = 1000
}

function M.config()
	local _, _ = pcall(vim.cmd.colorscheme, M.name)
end

return M
