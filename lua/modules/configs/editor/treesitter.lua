return vim.schedule_wrap(function()
	local use_ssh = require("core.settings").use_ssh

	vim.api.nvim_set_option_value("foldmethod", "expr", {})
	vim.api.nvim_set_option_value("foldexpr", "nvim_treesitter#foldexpr()", {})

	require("modules.utils").load_plugin("nvim-treesitter", {
		ensure_installed = require("core.settings").treesitter_deps,
		highlight = {
			enable = true,
			disable = function(ft, bufnr)
				if vim.tbl_contains({ "vim", "latex" }, ft) then
					return true
				end

				local max_filesize = 110 * 1024 -- 110 KB
				local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(bufnr))
				if ok and stats and stats.size > max_filesize then
					return true
				end

				-- TODO: this seem does not work: key not found bigfile_disable_treesitter
				local ok1, is_large_file = pcall(vim.api.nvim_buf_get_var, bufnr, "bigfile_disable_treesitter")
				if ok1 and is_large_file then
					vim.notify(string.format("[%s]  [%s]", ok, is_large_file), vim.log.levels.DEBUG)
				end
				return ok1 and is_large_file
			end,
			additional_vim_regex_highlighting = false,
		},
		textobjects = {
			select = {
				enable = true,
				keymaps = {
					["af"] = "@function.outer",
					["if"] = "@function.inner",
					["ac"] = "@class.outer",
					["ic"] = "@class.inner",
				},
			},
			move = {
				enable = true,
				set_jumps = true, -- whether to set jumps in the jumplist
				goto_next_start = {
					["]["] = "@function.outer",
					["]m"] = "@class.outer",
				},
				goto_next_end = {
					["]]"] = "@function.outer",
					["]M"] = "@class.outer",
				},
				goto_previous_start = {
					["[["] = "@function.outer",
					["[m"] = "@class.outer",
				},
				goto_previous_end = {
					["[]"] = "@function.outer",
					["[M"] = "@class.outer",
				},
			},
		},
		indent = { enable = true },
		matchup = { enable = true },
	}, false, require("nvim-treesitter.configs").setup)
	require("nvim-treesitter.install").prefer_git = true
	if use_ssh then
		local parsers = require("nvim-treesitter.parsers").get_parser_configs()
		for _, p in pairs(parsers) do
			p.install_info.url = p.install_info.url:gsub("https://github.com/", "git@github.com:")
		end
	end
end)
