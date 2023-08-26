-- =============================================================================
-- FileName  : authorinfo.lua
-- Describes : this script is to add doc information in file header
-- Author    : hzf
-- Email     : 1311618499@qq.com
-- Version   : 0.0
-- LastChange: 星期五 2022-07-01 14:21:02
-- History   :
-- =============================================================================
-- Dependence : numToStr/Comment.nvim
-- TODO:  每次修改后，在history中添加时间，然后把光标放到后面，方便添加信息，可能是倒
-- 序，即新的在旧的上面

local function findfirstline()
	local filetype = vim.bo.filetype
	local shebang = {
		sh = "^#![/%w+]+$",
		python = { "^#![/%w+]+%s%w+$", "coding" },
		-- php = "^<?.*",
	}
	local readnum = 0
	if filetype == "python" then
		readnum = 2
	elseif filetype == "sh" then
		readnum = 1
	end
	local findmatch = 0
	if readnum > 0 then
		local line = vim.api.nvim_buf_get_lines(0, 0, readnum, 1)
		for keyline, valline in pairs(line) do
			print(keyline)
			for key, val in pairs(shebang) do
				if key == "python" then
					for key2, val2 in pairs(val) do
						if string.find(valline, val2) then
							findmatch = findmatch + 1
						end
					end
				else
					if string.find(valline, val) then
						findmatch = findmatch + 1
					end
				end
			end
		end
	end
	return findmatch, filetype
end

-- local function before_title()
-- 	print("before_title")
-- end
-- local function after_title()
-- 	print("after_title")
-- end

local function addtitle()
	local Config = require("Comment").setup({ ignore = "^$" })
	local num_shebang, filetype_cur = findfirstline()
	-- before_title()
	local file = vim.api.nvim_buf_get_name(0)
	local filename = string.match(file, ".+/([^/]*%.%w+)$") -- 只有文件名，去除路径

	local email = "1311618499@qq.com"
	local name = "hzf"
	local time = os.date("%A %Y-%m-%d %H:%M:%S", os.time())

	local comment_str = {
		"=============================================================================",
		"  FileName: " .. filename,
		"    Author: " .. name,
		"     Email: " .. email,
		"   Version: 0.0.1",
		" Reference: ",
		"      Tags: ",
		" Describes: ",
		"LastChange: " .. time,
		"-- History: -----------------------------------------------------------------",
		"Created in " .. time,
		"=============================================================================",
	}

	local pattern = "FileName:"
	local pattern2 = "LastChange:"

	local result = vim.fn.getbufinfo()
	local numall = result[1].linecount -- HACK:
	local num20
	if numall > 30 then
		num20 = 30
	else
		num20 = numall
	end

	local line20 = vim.api.nvim_buf_get_lines(0, 0, num20, 1) -- NOTE:  比pos少一，应该是get_line 是从0开始

	local findtitle = 0
	local filenamechange = 0 -- NOTE: 现在没用
	-- 寻找注释，然后更新
	-- TODO: 只替换时间与文件名更好
	-- TODO: 可以尝试先全部取消注释，再注释
	for key, val in pairs(line20) do
		if string.find(val, pattern2) then
			findtitle = findtitle + 1
			local update_time = { "LastChange: " .. time }
			vim.api.nvim_buf_set_lines(0, key + filenamechange - 1, key + filenamechange, 1, update_time) -- 替换
			vim.api.nvim_win_set_cursor(0, { key + filenamechange, 1 })
			if filetype_cur ~= "c" and filetype_cur ~= "cpp" then
				-- require("Comment.api").toggle_current_linewise()
				require("Comment.api").locked("toggle.linewise.current")()
			end
			vim.api.nvim_win_set_cursor(0, { num_shebang + 11, 1 })
		end
		if string.find(val, pattern) then -- find 'FileName:'
			findtitle = findtitle + 1
			if not string.find(val, filename) then -- not find filename (changed)
				local update_filename = { "FileName: " .. filename }
				vim.api.nvim_buf_set_lines(0, key - 1, key, 1, update_filename) -- key, key 添加, 现在是文件名修改后替换
				vim.api.nvim_win_set_cursor(0, { key, 1 })
				if filetype_cur ~= "c" and filetype_cur ~= "cpp" then
					-- require("Comment.api").toggle_current_linewise()
					require("Comment.api").locked("toggle.linewise.current")()
				end
				vim.api.nvim_win_set_cursor(0, { num_shebang + 11, 1 })
			end
		end
	end

	-- no comment title and add
	if findtitle > 0 then
		vim.notify("Success to update doc information!")
	elseif findtitle == 0 then
		vim.api.nvim_buf_set_lines(0, num_shebang, num_shebang, 1, comment_str)
		vim.api.nvim_win_set_cursor(0, { num_shebang + 1, 1 })

		local comment_num = #comment_str
		-- require("Comment.api").toggle_linewise_count(Config)  -- TODO:  comment n count
		if filetype_cur ~= "c" and filetype_cur ~= "cpp" then --TODO:  comment.api
			require("Comment.api").toggle.linewise.count(comment_num, Config) -- line
		else
			require("Comment.api").toggle.blockwise.count(comment_num, Config) -- block eg   /*  */
		end
		vim.api.nvim_win_set_cursor(0, { num_shebang + 11, 13 })
		-- for key, val in pairs(lines2) do
		-- 	vim.api.nvim_win_set_cursor(0, { key + num_shebang, 1 })
		-- 	require("Comment.api").toggle_current_linewise(Config)
		-- end

		vim.notify("Success to add doc information!")
	end

	-- after_title()
	-- <Plug>(comment_toggle_current_linewise)
end

-- addtitle()
-- vim.api.nvim_set_keymap('n','<F4>','addtitle()')
vim.keymap.set("n", "<F4>", addtitle)
