return function()
	require("ltex-ls").setup({
		settings = {
			-- use_spellfile = true,
			ltex = {
				-- enabled = {"latex", "tex", "bib", "markdown",},
				disabledRules = {
					-- ["en-US"] = { "MORFOLOGIK_RULE_EN_US" },
					-- ["zh-CN"] = { "MORFOLOGIK_RULE_EN_US" },
				},
				dictionary = {
					["en-US"] = { ":" .. vim.fn.stdpath("data") .. "/spell/dictionary.txt" },
				},
			},
		},
	})
end
