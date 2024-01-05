local M = {
	"neovim/nvim-lspconfig",
	lazy = false,
	event = "BufReadPre",
	dependencies = {
		{
			"hrsh7th/cmp-nvim-lsp"
		},
		{
			"lopi-py/luau-lsp.nvim",
			dependencies = {
				{
					"nvim-lua/plenary.nvim"
				}
			}
		},
		{
			"williamboman/mason-lspconfig.nvim"
		}
	}
}

function M.config()
	local client_capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
	client_capabilities.textDocument.completion.completionItem.snippetSupport = false

	local on_attach = function (client, bufnr)
		print(client.name .. " attached!")
	end

	for _, lsp in pairs(require('settings.languages').lang_servers) do
		local lsp_opts = {
			capabilities = client_capabilities,
			on_attach = on_attach
		}

		lsp = vim.split(lsp, "@")[1] -- :gsub("-", "_")
		local ok, settings = pcall(require, "settings.lspservers." .. lsp)
		if ok then
			print("Loading config for ".. lsp)
			lsp_opts = vim.tbl_deep_extend("force", settings, lsp_opts)
		end

		if lsp == "luau_lsp" then
			require("luau-lsp").setup {
				sourcemap = {
					enabled = false
				},
				types = {
					roblox = true
				},
				server = {
					capabilities = client_capabilities,
					settings = settings or { }
				}
			}
		else
			require('lspconfig')[lsp].setup(lsp_opts)
		end
	end

	local signs = {
		{ name = "DiagnosticSignError", text = "" },
		{ name = "DiagnosticSignWarn", text = "" },
		{ name = "DiagnosticSignHint", text = "" },
		{ name = "DiagnosticSignInfo", text = "" },
	}

	for _, sign in ipairs(signs) do
		vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
	end

	vim.diagnostic.config {
		signs = {
			active = signs,
		},
		update_in_insert = true,
		underline = true,
		severity_sort = true,
		float = {
			focusable = false,
			style = "minimal",
			border = "rounded",
			source = "always",
			header = "",
			prefix = "",
			suffix = "",
		}
	}

	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
		border = "rounded"
	})

	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
		border = "rounded"
	})
end

return M
