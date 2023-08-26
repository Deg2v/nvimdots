return function()
	local snippet_path = vim.fn.stdpath("config") .. "/snips/"
	if not vim.tbl_contains(vim.opt.rtp:get(), snippet_path) then
		vim.opt.rtp:append(snippet_path)
	end

	-- vim.api.nvim_command("imap <silent><expr> <C-f> luasnip#choice_active() ? '<Plug>luasnip-next-choice'")
	-- vim.api.nvim_set_keymap("i", "<C-j>", "<Plug>luasnip-next-choice", {})
	-- vim.api.nvim_set_keymap("s", "<C-j>", "<Plug>luasnip-next-choice", {})
	require("modules.utils").load_plugin("luasnip", {
		history = true,
		update_events = "TextChanged,TextChangedI",
		delete_check_events = "TextChanged,InsertLeave",
	}, false, require("luasnip").config.set_config)
	require("luasnip.loaders.from_lua").lazy_load()
	require("luasnip.loaders.from_vscode").lazy_load()
	require("luasnip.loaders.from_snipmate").lazy_load()
end

-- -- vim.keymap.set({ "i", "s" }, "<C-u>", '<cmd>lua require("luasnip.extras.select_choice")()<cr><C-c><C-c>')
