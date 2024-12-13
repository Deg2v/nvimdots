return function()
	require("modules.utils").load_plugin("vim-illuminate", {
		providers = {
			"lsp",
			"treesitter",
			"regex",
		},
		delay = 100,
		filetypes_denylist = {
			"DoomInfo",
			"DressingSelect",
			"NvimTree",
			"TelescopePrompt",
			"Trouble",
			"aerial",
			"alpha",
			"dashboard",
			"dirvish",
			"fugitive",
			"help",
			"neogitstatus",
			"norg",
			"toggleterm",
		},
		under_cursor = false,
	}, false, require("illuminate").configure)

	local highlights = {
		-- 	-- Illuminate
		IlluminatedWord = { bg = "#c13ffc" },
		IlluminatedCurWord = { bg = "#7e3ffc" },
		-- IlluminatedWordText = { bg = "#b4918a" },
		-- IlluminatedWordRead = { bg = "#B2D484" },-- #404c63
		IlluminatedWordRead = { bg = "#626b7f" }, -- #404c63
		IlluminatedWordWrite = { bg = "#4c8e94" },
		-- IlluminatedWordWrite = { bg = "#abccda" },
		["@variable.parameter"] = { italic = true },
	}

	for group, value in pairs(highlights) do
		vim.api.nvim_set_hl(0, group, value)
	end
end
