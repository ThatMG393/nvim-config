local M = {
	"briones-gabriel/darcula-solid.nvim",
	dependencies = {
		"rktjmp/lush.nvim"
	},
	lazy = false,
	priority = 1000
}

M.name = "darcula-solid"
function M.config()
	local ok, _ = pcall(vim.cmd.colorscheme, M.name)
	if ok then
		return
	end
end

return M
