return function()
	-- Lua
	require("onedark").setup({
		-- Main options --
		style = "dark", -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
		transparent = false, -- Show/hide background
		term_colors = true, -- Change terminal color as per the selected theme style
		ending_tildes = false, -- Show the end-of-buffer tildes. By default they are hidden
		-- toggle theme style ---
		toggle_style_key = "<leader>ts", -- Default keybinding to toggle
		toggle_style_list = { "dark", "darker", "cool", "deep", "warm", "warmer", "light" }, -- List of styles to toggle between

		-- Change code style ---
		-- Options are italic, bold, underline, none
		-- You can configure multiple style with comma seperated, For e.g., keywords = 'italic,bold'
		code_style = {
			comments = "italic",
			keywords = "italic",
			functions = "bold",
			strings = "none",
			variables = "none",
		},

		-- Custom Highlights --
		colors = {
			bright_orange = "#ff8800", -- define a new color
			-- green = '#00ffaa',            -- redefine an existing color
		}, -- Override default colors
		highlights = {
			["@variable"] = { fg = "#e06150" },
			["@parameter"] = { fg = "#ffb900" },
			["@parameter.reference"] = { fg = "#00ffaa" },
			["@comment"] = { fg = "#abb9b1" },
			-- ["@comment"] = { fg = "#a1b976" },
			rainbowcol1 = { fg = "#ff8800" },
		}, -- Override highlight groups

		-- Plugins Config --
		diagnostics = {
			darker = true, -- darker colors for diagnostic
			undercurl = true, -- use undercurl instead of underline for diagnostics
			background = true, -- use background color for virtual text
		},
	})
end
