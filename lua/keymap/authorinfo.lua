-- =============================================================================
-- FileName  : authorinfo.lua
-- Describes : this script is to add doc information in file header
-- Author    : hzf
-- Email     : 1311618499@qq.com
-- Version   : 0.0
-- LastChange: 星期四 2024-09-26 19:37:23
-- History   :
-- =============================================================================
-- Dependence :echasnovski/mini.comment
-- TODO:  每次修改后，在history中添加时间，然后把光标放到后面，方便添加信息，可能是倒
-- 序，即新的在旧的上面
-- # -*- coding: utf-8 -*- will bug ,使用vim._comment好像不会了，先放着吧

local M = {}
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
		local line = vim.api.nvim_buf_get_lines(0, 0, readnum, true)
		for _, valline in pairs(line) do
			for key, val in pairs(shebang) do
				if key == "python" then
					for _, val2 in pairs(val) do
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

function M.addtitle()
	-- = addtitle()
	local num_shebang, filetype_cur = findfirstline()
	-- before_title()
	local file = vim.api.nvim_buf_get_name(0)
	local filename = string.match(file, ".+/([^/]*%.%w+)$") -- 只有文件名，去除路径

	local settings = require("settings")
	local email = settings.email
	local name = settings.name
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
		"- History: -----------------------------------------------------------------",
		"Created in " .. time,
		"=============================================================================",
	}

	local pattern_file = "FileName:"
	local pattern_ch = "LastChange:"

	local result = vim.fn.getbufinfo()
	local numall = result[1].linecount -- HACK:
	local num20
	if numall > 30 then
		num20 = 30
	else
		num20 = numall
	end

	-- 读取20行
	local line20 = vim.api.nvim_buf_get_lines(0, 0, num20, true) -- NOTE:  比pos少一，应该是get_line 是从0开始

	local findtitle = 0
	local filenamechange = 0 -- NOTE: 现在没用

	-- 寻找注释，然后更新
	-- TODO: 只替换时间与文件名更好
	-- TODO: 可以尝试先全部取消注释，再注释
	for key, val in pairs(line20) do
		if string.find(val, pattern_ch) then
			findtitle = findtitle + 1
			local update_time = { "LastChange: " .. time }
			vim.api.nvim_buf_set_lines(0, key + filenamechange - 1, key + filenamechange, true, update_time) -- 替换
			vim.api.nvim_win_set_cursor(0, { key + filenamechange, 1 })
			require("vim._comment").toggle_lines(key, key)
			vim.api.nvim_win_set_cursor(0, { num_shebang + 11, 1 }) -- 放在11行，是想写更新信息
		end
		-- INFO: 更新文件名，如果修改了
		if string.find(val, pattern_file) then -- find 'FileName:'
			findtitle = findtitle + 1
			if not string.find(val, filename) then -- 判断var中是不是有文件名
				local update_filename = { "FileName: " .. filename }
				vim.api.nvim_buf_set_lines(0, key - 1, key, true, update_filename) -- start = end 是添加, 现在是文件名修改后替换
				-- vim.api.nvim_win_set_cursor(0, { key, 1 }) -- 设置光标，似乎没有用了

				require("vim._comment").toggle_lines(key, key)
				vim.api.nvim_win_set_cursor(0, { num_shebang + 11, 1 })
			end
		end
	end

	-- no comment title and add
	if findtitle > 0 then
		vim.notify("Success to update doc information!", vim.log.levels.INFO, { title = "doc" })
	-- findtitle 是指在前20行内没有找到 FileName和LastChange，但是如果前20行只有出现一个，只会这样
	elseif findtitle == 0 then
		vim.api.nvim_buf_set_lines(0, num_shebang, num_shebang, true, comment_str) -- add information
		vim.api.nvim_win_set_cursor(0, { num_shebang + 1, 1 })

		-- comment
		local comment_num = #comment_str
		require("vim._comment").toggle_lines(1, comment_num + num_shebang)

		vim.api.nvim_win_set_cursor(0, { num_shebang + 11, 13 })

		vim.notify("Success to add doc information!", vim.log.levels.INFO, { title = "doc" })
	end

	-- after_title()
end

return M

-- vim.api.nvim_set_keymap("n", "<F4>", "addtitle()", { noremap = true })
-- addtitle()
-- vim.api.nvim_set_keymap('n','<F4>','addtitle()')
-- vim.keymap.set("n", "<F4>", addtitle)
--
--判断文件格式
-- if filetype_cur ~= "c" and filetype_cur ~= "cpp" then
-- end
