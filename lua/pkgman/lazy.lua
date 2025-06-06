local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
	vim.fn.system {
		"git",
		"clone",
		"--depth=1",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath
	}
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins", {
	install = {
		colorscheme = {
			require("plugins.colorscheme").name
		},
	},
	ui = {
		border = "rounded",
	},
	change_detection = {
		enabled = true,
    		notify = false
	},
	defaults = {
		lazy = true
	},
	debug = false
})
