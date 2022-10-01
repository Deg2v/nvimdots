-- author: glepnr https://github.com/glepnir
-- date: 2022-07-02
-- License: MIT
-- 			component_separators = { left = "", right = "" },
-- 			section_separators = { left = "▊", right = "" },
-- 	local M = {}
-- M.separators = {
--     vertical_bar = '┃',
--     vertical_bar_thin = '│',
--     left = '',
--     right = '',
--     block = '█',
--     block_thin = "▌",
--     left_filled = '',
--     right_filled = '',
--     slant_left = '',
--     slant_left_thin = '',
--     slant_right = '',
--     slant_right_thin = '',
--     slant_left_2 = '',
--     slant_left_2_thin = '',
--     slant_right_2 = '',
--     slant_right_2_thin = '',
--     left_rounded = '',
--     left_rounded_thin = '',
--     right_rounded = '',
--     right_rounded_thin = '',
--     circle = '●'
-- }

-- theme.default = {
--   bg = '#202328',
--   fg = '#bbc2cf',
--   yellow = '#ECBE7B',
--   cyan = '#008080',
--   darkblue = '#081633',
--   green = '#98be65',
--   orange = '#FF8800',
--   violet = '#a9a1e1',
--   magenta = '#c678dd',
--   blue = '#51afef';
--   red = '#ec5f67';
-- }

local status_ok, galaxyline = pcall(require, "galaxyline")
local vim = vim
if not status_ok then
	return
end

local function buffer_is_readonly()
	if vim.bo.filetype == "help" then
		return false
	end
	return vim.bo.readonly
end
-- local colors = require("galaxyline.theme").default
local condition = require("galaxyline.condition")
local fileinfo = require("galaxyline.provider_fileinfo")
local gls = galaxyline.section
local navic = require("nvim-navic")
galaxyline.short_line_list = { "NvimTree", "vista", "dbui", "packer" }

local colors = {
	main = "#ff87ff",
	bg_alt = "#0B0C15",
	main_bg = "#262626",
	lightbg = "#21252B",
	commented = "#5c6370",
	grey = "#3c4048",
	line_bg = "#282c34",
	creamydark = "#282c34",
	purple = "#252930",
	cyan = "#00FFFF",
	nord = "#81A1C1",
	lightblue = "#81a1c1",
	darkblue = "#61afef",
	blue = "#61afef",
	limegreen = "#bbe67e",
	--   green = '#98be65',
	violet = "#a9a1e1",
	green = "#7ed491",
	fg_green = "#65a380",
	creamygreen = "#a3be8c",
	yellow = "#cccc00",
	orange = "#FF8800",
	bg = "#00B0C15",
	-- bg = "#202328",
	fg = "#D8DEE9",
	magenta = "#c678dd",
	red = "#ec5f67",
	-- red = "#df8890",
	crimsonRed = "#990000",
	crimsonRed2 = "#ff4d4d",
	greenYel = "#EBCB8B",
	white = "#d8dee9",
	brown = "#91684a",
	teal = "#23D4AC",
	blue2 = "#5c5c81",
	icon_inactive = "#9896AA",
}

----------------------------------- ==== function === -------------------------------------------------
local checkwidth = function()
	local squeeze_width = vim.fn.winwidth(0) / 2
	if squeeze_width > 40 then
		return true
	end
	return false
end
local function file_name(is_active, highlight_group)
	local normal_fg = is_active and colors.green or colors.blue2
	local modified_fg = is_active and "#ff0000" or "#cc8800"
	if vim.bo.modifiable then
		if vim.bo.modified then
			vim.api.nvim_command("hi " .. highlight_group .. " guifg=" .. modified_fg .. " gui=bold")
		else
			vim.api.nvim_command("hi " .. highlight_group .. " guifg=" .. normal_fg .. " gui=NONE")
		end
	end

	if buffer_is_readonly() then
		vim.api.nvim_command("hi " .. highlight_group .. " guifg=" .. modified_fg .. " gui=bold")
		-- file = readonly_icon .. ' ' ..file
	end
	local fname = fileinfo.get_current_file_name("", "")
	-- local fname = fileinfo.get_current_file_name(icons.file.modified, icons.file.read_only)
	-- if (require("galaxyline.condition").check_git_workspace()) and checkwidth() then
	-- 	local git_dir = require("galaxyline.provider_vcs").get_git_dir(vim.fn.expand("%:p"))
	-- 	local current_dir = vim.fn.expand("%:p:h")
	-- 	if git_dir == current_dir .. "/.git" or git_dir == nil then
	-- 		return fname
	-- 	end
	-- 	local get_path_from_git_root = current_dir:sub(#git_dir - 3)
	-- 	return get_path_from_git_root .. "/" .. fname
	-- end
	return fname
end

-- local function location_content()
-- 	if navic.is_available() and navic.get_location() ~= "" then
-- 		print(navic.get_location())
-- 		return navic.get_location()
-- 	else
-- 		return ""
-- 	end
-- end

local function python_venv()
	local function env_cleanup(venv)
		if string.find(venv, "/") then
			local final_venv = venv
			for w in venv:gmatch("([^/]+)") do
				final_venv = w
			end
			venv = final_venv
		end
		return venv
	end

	if vim.bo.filetype == "python" then
		local venv = os.getenv("CONDA_DEFAULT_ENV")
		if venv then
			return string.format("%s", env_cleanup(venv))
		end
		venv = os.getenv("VIRTUAL_ENV")
		if venv then
			return string.format("%s", env_cleanup(venv))
		end
	end
	return ""
end

local function escape_status()
	local ok, m = pcall(require, "better_escape")
	return ok and m.waiting and " ✺ " or ""
end
----------------------------------- ==== left === -------------------------------------------------
gls.left[1] = {
	-- RainbowRed = {
	-- 	provider = function()
	-- 		return "█  " .. "  " .. os.date("%H:%M") .. " "
	-- 	end,
	-- 	-- highlight = { colors.background, colors.green },
	-- 	highlight = { colors.blue, colors.bg },
	-- 	separator = " ",
	-- 	separator_highlight = { colors.lightBackground, colors.lightBackground },
	-- },
	RainbowRed = {
		provider = function()
			-- return " " .. "  " .. os.date("%H:%M")
			return "█ "
		end,
		highlight = { colors.blue, colors.bg },
	},
}

gls.left[2] = {
	ViMode = {
		provider = function()
			-- auto change color according the vim mode
			local mode_color = {
				n = colors.red,
				i = colors.green,
				v = colors.blue,
				[""] = colors.brown,
				V = colors.lightblue,
				c = colors.orange,
				no = colors.red,
				s = colors.greenYel,
				S = colors.greenYel,
				[""] = colors.greenYel,
				ic = colors.green,
				R = colors.crimsonRed2,
				Rv = colors.crimsonRed2,
				cv = colors.orange,
				ce = colors.orange,
				r = colors.blue2,
				rm = colors.blue2,
				["r?"] = colors.lightblue,
				["!"] = colors.crimsonRed,
				t = colors.magenta,
			}
			local aliasname = {
				n = "NORMAL ",
				no = "NORMAL ",
				i = "INSERT ",
				ic = "INSERT ",
				c = "COMMAND ",
				ce = "COMMAND ",
				cv = "COMMAND ",
				v = "VISUAL ",
				V = "VISUAL ",
				[""] = "VISUAL ",
				R = "REPLACE ",
				["r?"] = "REPLACE ",
				Rv = "REPLACE ",
				r = "REPLACE ",
				rm = "REPLACE ",
				s = "SELECT  ",
				S = "SELECT  ",
				[""] = "SELECT  ",
				t = "TERMINAL",
				["!"] = "THELE",
			}
			vim.api.nvim_command("hi GalaxyViMode guifg=" .. mode_color[vim.fn.mode()] .. " guibg=" .. colors.bg)
			return aliasname[vim.fn.mode()]
			-- return " "
		end,
	},
}

gls.left[3] = {
	FileSize = {
		condition = condition.buffer_not_empty,
		highlight = { colors.fg, colors.bg },
		provider = "FileSize",
	},
}

gls.left[4] = {
	FileIcon = {
		condition = condition.buffer_not_empty,
		highlight = { require("galaxyline.provider_fileinfo").get_file_icon_color, colors.bg },
		provider = "FileIcon",
		separator = "",
	},
}

gls.left[5] = {
	FileName = {
		condition = condition.buffer_not_empty,
		highlight = {
			colors.green,
			colors.bg,
			"bold",
		},
		provider = function()
			return file_name(true, "GalaxyFileName")
		end,
		-- provider = "FileName",
		separator = "",
	},
}

gls.left[6] = {
	LineInfo = {
		highlight = { colors.fg, colors.bg },
		provider = "LineColumn",
		separator = "",
		separator_highlight = { "NONE", colors.bg },
	},
}

gls.left[7] = {
	PerCent = {
		highlight = { colors.fg, colors.bg, "bold" },
		provider = "LinePercent",
		separator = "",
		separator_highlight = { "NONE", colors.bg },
	},
}

gls.left[8] = {
	DiagnosticError = {
		highlight = { colors.red, colors.bg },
		icon = "  ",
		provider = "DiagnosticError",
	},
}

gls.left[9] = {
	DiagnosticWarn = {
		highlight = { colors.yellow, colors.bg },
		icon = "  ",
		provider = "DiagnosticWarn",
	},
}

gls.left[10] = {
	DiagnosticHint = {
		highlight = { colors.cyan, colors.bg },
		icon = "  ",
		provider = "DiagnosticHint",
	},
}

gls.left[11] = {
	DiagnosticInfo = {
		highlight = { colors.blue, colors.bg },
		icon = "  ",
		provider = "DiagnosticInfo",
	},
}

gls.left[12] = {
	nvimNavic = {
		provider = function()
			return navic.get_location()
		end,
		condition = function()
			return navic.is_available()
		end,
		highlight = { colors.magenta, colors.bg },
	},
}
gls.mid[1] = {
	ShowLspClient = {
		condition = function()
			local tbl = { ["dashboard"] = true, [""] = true }
			if tbl[vim.bo.filetype] then
				return false
			end
			return true
		end,
		highlight = { colors.yellow, colors.bg, "bold" },
		icon = " LSP:",
		provider = "GetLspClient",
	},
}

gls.right[7] = {
	FileEncode = {
		condition = condition.hide_in_width,
		highlight = { colors.green, colors.bg, "bold" },
		provider = "FileEncode",
		separator = "",
		separator_highlight = { "NONE", colors.bg },
	},
}

gls.right[8] = {
	FileFormat = {
		condition = condition.hide_in_width,
		highlight = { colors.green, colors.bg, "bold" },
		provider = "FileFormat",
		separator = "",
		separator_highlight = { "NONE", colors.bg },
	},
}

gls.right[1] = {
	GitIcon = {
		provider = function()
			return "  "
		end,
		condition = condition.check_git_workspace,
		highlight = { colors.violet, colors.bg, "bold" },
		separator = "",
		separator_highlight = { "NONE", colors.bg },
	},
}

gls.right[2] = {
	GitBranch = {
		condition = condition.check_git_workspace,
		highlight = { colors.violet, colors.bg, "bold" },
		provider = "GitBranch",
	},
}

gls.right[3] = {
	Separator = {
		provider = function()
			return " "
		end,
	},
}

gls.right[4] = {
	DiffAdd = {
		condition = condition.hide_in_width,
		highlight = { colors.green, colors.bg },
		icon = "  ",
		provider = "DiffAdd",
	},
}

gls.right[5] = {
	DiffModified = {
		condition = condition.hide_in_width,
		highlight = { colors.orange, colors.bg },
		icon = " 柳",
		provider = "DiffModified",
	},
}

gls.right[6] = {
	DiffRemove = {
		condition = condition.hide_in_width,
		highlight = { colors.red, colors.bg },
		icon = "  ",
		provider = "DiffRemove",
	},
}

gls.right[9] = {
	RainbowBlue = {
		provider = function()
			return " ▊"
		end,
		highlight = { colors.blue, colors.bg },
	},
}

gls.right[10] = {
	PythonEnv = {
		provider = function()
			return python_venv()
		end,
		highlight = { colors.yellow, colors.blue },
	},
}
gls.short_line_left[1] = {
	BufferType = {
		highlight = { colors.blue, colors.bg, "bold" },
		provider = "FileTypeName",
		separator = "",
		separator_highlight = { "NONE", colors.bg },
	},
}

gls.short_line_left[2] = {
	SFileName = {
		condition = condition.buffer_not_empty,
		highlight = { colors.red, colors.bg, "bold" },
		provider = "SFileName",
	},
}

gls.short_line_right[1] = {
	BufferIcon = {
		highlight = { colors.red, colors.bg },
		provider = "BufferIcon",
	},
}

gls.mid[2] = {
	EscapeIcon = {
		provider = function()
			return escape_status()
		end,
	},
}
