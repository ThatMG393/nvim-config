local M = {
	  "nvim-lualine/lualine.nvim",
	  events = {
		  "VimEnter",
		  "InsertEnter",
		  "BufReadPre",
		  "BufAdd",
		  "BufNew",
		  "BufReadPost"
	  }
}

function M.config()
    local hide_in_width = function()
        return vim.fn.winwidth(0) > 80
    end

    local diagnostics = {
        "diagnostics",
        sources = { "nvim_diagnostic" },
        sections = { "error", "warn" },
        symbols = { error = " ", warn = " " },
        colored = true,
        always_visible = true,
    }

    local diff = {
        "diff",
        colored = true,
        always_visible = false,
        symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
        cond = hide_in_width,
    }

    local filetype = {
        "filetype",
        icons_enabled = true,
    }

    local location = {
        "location",
        padding = 0,
    }

    local indent = function()
        return "indent: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
    end

    require('lualine').setup {
        options = {
            globalstatus = true,
            icons_enabled = true,
            theme = "auto",
            component_separators = { left = "", right = "" },
            section_separators = { left = "", right = "" },
            disabled_filetypes = { "alpha", "dashboard" },
            always_divide_middle = true,
        },
        sections = {
            lualine_a = { "mode" },
            lualine_b = { "branch" },
            lualine_c = { diagnostics },
            lualine_x = { diff, indent, "encoding", filetype },
            lualine_y = { location },
            lualine_z = { "progress" }
        }
    }
end

return M
