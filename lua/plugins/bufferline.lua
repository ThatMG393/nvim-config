local M = {
	"akinsho/bufferline.nvim",
	lazy = false,
	dependencies = {
		{
			"nvim-tree/nvim-web-devicons"
		}
	}
}

function M.config()
	require("bufferline").setup {
		options = {
			hover = {
				enabled = false
			},
			separator_style = "slant",
			tab_size = 18,
			offsets = {
				{
					filetype = "NvimTree",
					text = "File Explorer",
					text_align = "left",
					separator = true
				}
			},
			always_show_bufferline = true,
			diagnostics = "nvim_lsp"
		}
	}
end

return M

