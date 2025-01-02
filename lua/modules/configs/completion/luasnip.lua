return function()
	local vim_path = require("core.global").vim_path
	local snippet_path = vim_path .. "/snips/"
	local user_snippet_path = vim_path .. "/lua/user/snips/"

	-- vim.api.nvim_command("imap <silent><expr> <C-f> luasnip#choice_active() ? '<Plug>luasnip-next-choice'")
	-- vim.api.nvim_set_keymap("i", "<C-j>", "<Plug>luasnip-next-choice", {})
	-- vim.api.nvim_set_keymap("s", "<C-j>", "<Plug>luasnip-next-choice", {})
	require("modules.utils").load_plugin("luasnip", {
		history = true,
		update_events = "TextChanged,TextChangedI",
		delete_check_events = "TextChanged,InsertLeave",
	}, false, require("luasnip").config.set_config)

	require("luasnip.loaders.from_vscode").lazy_load({
		paths = {
			snippet_path,
			user_snippet_path,
		},
	})
	require("luasnip.loaders.from_lua").lazy_load()
	require("luasnip.loaders.from_vscode").lazy_load()
	require("luasnip.loaders.from_snipmate").lazy_load()
end

-- -- vim.keymap.set({ "i", "s" }, "<C-u>", '<cmd>lua require("luasnip.extras.select_choice")()<cr><C-c><C-c>')
