-- function config.lualine()
local gps = require("nvim-gps")

local function escape_status()
	local ok, m = pcall(require, "better_escape")
	return ok and m.waiting and "✺ " or ""
end

local function gps_content()
	if gps.is_available() then
		return gps.get_location()
	else
		return ""
	end
end
local colors = {
	bg = "#202328",
	fg = "#bbc2cf",
	yellow = "#ECBE7B",
	cyan = "#008080",
	darkblue = "#081633",
	green = "#98be65",
	orange = "#FF8800",
	violet = "#a9a1e1",
	magenta = "#c678dd",
	blue = "#51afef",
	red = "#ec5f67",
}

local custom_fname = require("lualine.components.filename"):extend()
local highlight = require("lualine.highlight")
-- local default_status_colors = { saved = '#228B22', modified = '#C70039' }
local default_status_colors = { saved = "#98be65", modified = "#C70039" }

function custom_fname:init(options)
	custom_fname.super.init(self, options)
	self.status_colors = {
		saved = highlight.create_component_highlight_group(
			{ fg = default_status_colors.saved },
			"filename_status_saved",
			self.options
		),
		modified = highlight.create_component_highlight_group(
			{ fg = default_status_colors.modified },
			"filename_status_modified",
			self.options
		),
	}
	if self.options.color == nil then
		self.options.color = ""
	end
end

function custom_fname:update_status()
	local data = custom_fname.super.update_status(self)
	data = highlight.component_format_highlight(
		vim.bo.modified and self.status_colors.modified or self.status_colors.saved
	) .. data
	return data
end

-- require'lualine'.setup {
--   lualine_c = {custom_fname},
-- }
local conditions = {
	buffer_not_empty = function()
		return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
	end,
	hide_in_width = function()
		return vim.fn.winwidth(0) > 80
	end,
	check_git_workspace = function()
		local filepath = vim.fn.expand("%:p:h")
		local gitdir = vim.fn.finddir(".git", filepath .. ";")
		return gitdir and #gitdir > 0 and #gitdir < #filepath
	end,
}
local mini_sections = {
	lualine_a = {},
	lualine_b = {},
	lualine_c = {},
	lualine_x = {},
	lualine_y = {},
	lualine_z = { "location" },
}
local simple_sections = {
	lualine_a = { "mode" },
	lualine_b = { "filetype" },
	lualine_c = {},
	lualine_x = {},
	lualine_y = {},
	lualine_z = { "location" },
}
local aerial = {
	sections = mini_sections,
	filetypes = { "aerial" },
}
local dapui_scopes = {
	sections = simple_sections,
	filetypes = { "dapui_scopes" },
}

local dapui_breakpoints = {
	sections = simple_sections,
	filetypes = { "dapui_breakpoints" },
}

local dapui_stacks = {
	sections = simple_sections,
	filetypes = { "dapui_stacks" },
}

local dapui_watches = {
	sections = simple_sections,
	filetypes = { "dapui_watches" },
}

-- Config
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

local config1 = {
	options = {
		-- Disable sections and component separators
		icons_enabled = true,
		-- component_separators = '',
		component_separators = { left = "", right = "" },
		-- section_separators = {left = "", right = ""},
		-- section_separators = {left = "▊", right = "▊"},
		section_separators = { left = "", right = "" },
		-- section_separators = {left = "▊", right = "▊"},

		-- theme = "catppuccin"
		theme = "onedark",

		--   theme = {
		--     -- We are going to use lualine_c an lualine_x as left and
		--     -- right section. Both are highlighted by c theme .  So we
		--     -- are just setting default looks o statusline
		--     normal = { c = { fg = colors.fg, bg = colors.bg } },
		--     inactive = { c = { fg = colors.fg, bg = colors.bg } },
		--   },
	},

	-- these are to remove the defaults
	sections = {
		lualine_a = { "mode" },
		lualine_b = {},
		lualine_x = {
			{ escape_status },
		},
		lualine_y = {
			{ python_venv },
			{ "filetype", colored = true, icon_only = true },
			{ "encoding" },
			{
				"fileformat",
				icons_enabled = true,
				symbols = {
					unix = "", -- e712
					dos = "", -- e70f
					mac = "", -- e711
					-- unix = "LF",
					-- dos = "CRLF",
					-- mac = "CR",
				},
			},
		},
		lualine_z = { "%l:%c", "%p%%/%L" },
		-- These will be filled later
		lualine_c = {},
		-- lualine_x = {},
	},
	inactive_sections = {
		-- these are to remove the defaults
		lualine_a = {},
		lualine_b = {},
		lualine_y = {},
		lualine_z = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
	},
	tabline = {},
	extensions = {
		"quickfix",
		"nvim-tree",
		"toggleterm",
		"fugitive",
		aerial,
		dapui_scopes,
		dapui_breakpoints,
		dapui_stacks,
		dapui_watches,
	},
}

-- Inserts a component in lualine_c at left section
local function ins_left(component)
	table.insert(config1.sections.lualine_c, component)
end

-- Inserts a component in lualine_x ot right section
local function ins_right(component)
	table.insert(config1.sections.lualine_x, component)
end

ins_left({
	custom_fname,
	-- cond = conditions.buffer_not_empty,
	-- color = { fg = colors.green, gui = 'bold' },
	-- {modified,color ={fg = colors.magenta, gui = 'bold'}},
	-- color = { fg = colors.magenta, gui = 'bold' },
})
ins_left({
	-- filesize component
	"filesize",
	cond = conditions.buffer_not_empty,
	color = { fg = colors.cyan, gui = "bold" },
})

ins_left({
	-- "lsp_progress",
	gps_content,
	cond = gps.is_available,
	color = { fg = colors.magenta, gui = "bold" },
})

--   ins_left({ '%l:%c  %p%%/%L',
--   color = { fg = colors.magenta, gui = 'bold' },
-- })

--   ins_left({ 'progress', color = { fg = colors.fg, gui = 'bold' } })

ins_left({
	"diagnostics",
	sources = { "nvim_diagnostic" },
	symbols = { error = " ", warn = " ", info = " ", hint = " " },
	diagnostics_color = {
		color_error = { fg = "#e32636" },
		warn = { fg = "#ffa500" },
		info = { fg = "#ebdbb2" },
		hint = { fg = colors.magenta },
	},
})

-- Insert mid section. You can make any number of sections in neovim :)
-- for lualine it's any number greater then 2
--   ins_left({
-- 	function()
-- 	  return '%='
-- 	end,
--   })

-- ins_left({
-- 	-- Lsp server name .
-- 	function()
-- 		local msg = "No Active Lsp"
-- 		local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
-- 		local clients = vim.lsp.get_active_clients()
-- 		if next(clients) == nil then
-- 			return msg
-- 		end
-- 		for _, client in ipairs(clients) do
-- 			local filetypes = client.config1.filetypes
-- 			if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
-- 				return client.name
-- 			end
-- 		end
-- 		return msg
-- 	end,
-- 	icon = " LSP:",
-- 	color = { fg = "#ff8800", gui = "bold" },
-- })

ins_left({
	-- ShowLspClient = {
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
	-- },
})

ins_right({
	"branch",
	icon = "",
	color = { fg = colors.violet, gui = "bold" },
})

ins_right({
	"diff",
	-- Is it me or the symbol for modified us really weird
	symbols = { added = " ", modified = "柳 ", removed = " " },
	diff_color = {
		added = { fg = colors.red },
		modified = { fg = colors.orange },
		removed = { fg = colors.magenta },
	},
	cond = conditions.hide_in_width,
})

require("lualine").setup(config1)
-- end
