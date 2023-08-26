return function()
	local db = require("dashboard")
	db.setup({
		theme = "hyper",
		config = {
			week_header = {
				enable = true,
				concat = "hello!",
			},
			project = {
				enable = true,
			},
			disable_move = true,
			shortcut = {
				{
					desc = "Update",
					icon = " ",
					group = "Include",
					action = "Lazy update",
					key = "u",
				},
				{
					desc = "Newfile",
					icon = " ",
					group = "Include",
					action = "ene",
					key = "e",
				},
				{
					icon = " ",
					desc = "Files",
					group = "Function",
					action = "Telescope find_files find_command=rg,--ignore,--hidden,--files",
					key = "f",
				},
				{
					icon = " ",
					desc = "Apps",
					group = "String",
					action = "Telescope app",
					key = "a",
				},
				{
					icon = " ",
					desc = "dotfiles",
					group = "Constant",
					action = "Telescope dotfiles",
					key = "d",
				},
			},
		},
	})
end
