return function()
	local snippet_path = vim.fn.stdpath("config") .. "/snips/"
	if not vim.tbl_contains(vim.opt.rtp:get(), snippet_path) then
		vim.opt.rtp:append(snippet_path)
	end

	-- REFER: https://github.com/L3MON4D3/LuaSnip/issues/701
	local ls = require("luasnip")
	-- Virtual Text
	local types = require("luasnip.util.types")
	-- ls.config.set_config({
	ls.setup({
		history = true, --keep around last snippet local to jump back
		updateevents = "TextChanged,TextChangedI", --update changes as you type
		enable_autosnippets = true,
		ext_opts = {
			[types.choiceNode] = {
				active = {
					virt_text = { { "●", "#00ffaa" } },
				},
			},
			-- [types.insertNode] = {
			-- 	active = {
			-- 		virt_text = { { "●", "GruvboxBlue" } },
			-- 	},
			-- },
		},
	})

	-- local ls = require("luasnip")
	vim.keymap.set({ "i", "s" }, "<C-j>", function()
		if ls.choice_active() then
			ls.change_choice(1)
		else
			-- print current time
			local t = os.date("*t")
			local time = string.format("%02d:%02d:%02d", t.hour, t.min, t.sec)
			print(time)
		end
	end)

	vim.keymap.set({ "i", "s" }, "<C-k>", function()
		if ls.choice_active() then
			ls.change_choice(-1)
		else
			-- print current time
			local t = os.date("*t")
			local time = string.format("%02d:%02d:%02d", t.hour, t.min, t.sec)
			print(time)
		end
	end)
	-- vim.api.nvim_command("imap <silent><expr> <C-f> luasnip#choice_active() ? '<Plug>luasnip-next-choice'")
	-- vim.api.nvim_set_keymap("i", "<C-j>", "<Plug>luasnip-next-choice", {})
	-- vim.api.nvim_set_keymap("s", "<C-j>", "<Plug>luasnip-next-choice", {})
	require("luasnip").config.set_config({
		history = true,
		update_events = "TextChanged,TextChangedI",
		delete_check_events = "TextChanged,InsertLeave",
	})
	require("luasnip.loaders.from_lua").lazy_load()
	require("luasnip.loaders.from_vscode").lazy_load()
	require("luasnip.loaders.from_snipmate").lazy_load()
end

-- -- vim.keymap.set({ "i", "s" }, "<C-u>", '<cmd>lua require("luasnip.extras.select_choice")()<cr><C-c><C-c>')
