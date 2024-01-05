return {
	settings = {
		["luau_lsp"] = {
			types = {
				roblox = true
			},
			sourcemap = {
				enabled = false,
				autogenerate = false
			},
			inlayHints = {
				functionReturnTypes = true,
				parameterNames = "all",
				parameterTypes = true
			},
			completion = {
				imports = {
					enabled = true
				}
			}
		}
	}
}
