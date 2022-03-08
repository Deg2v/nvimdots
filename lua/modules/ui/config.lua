local config = {}

function config.edge()
	vim.cmd([[set background=dark]])
	vim.g.edge_style = "aura"
	vim.g.edge_enable_italic = 1
	vim.g.edge_disable_italic_comment = 1
	vim.g.edge_show_eob = 1
	vim.g.edge_better_performance = 1
	vim.g.edge_transparent_background = 1
end

function config.kanagawa()
	require("kanagawa").setup({
		undercurl = true, -- enable undercurls
		commentStyle = "italic",
		functionStyle = "bold,italic",
		keywordStyle = "italic",
		statementStyle = "bold",
		typeStyle = "NONE",
		variablebuiltinStyle = "italic",
		specialReturn = true, -- special highlight for the return keyword
		specialException = true, -- special highlight for exception handling keywords
		transparent = false, -- do not set background color
		dimInactive = true, -- dim inactive window `:h hl-NormalNC`
		colors = {},
		overrides = {},
	})
end

function config.catppuccin()
	require("catppuccin").setup({
		transparent_background = true,
		term_colors = true,
		styles = {
			comments = "italic",
			functions = "italic,bold",
			keywords = "italic",
			strings = "NONE",
			variables = "NONE",
		},
		integrations = {
			treesitter = true,
			native_lsp = {
				enabled = true,
				virtual_text = {
					errors = "italic",
					hints = "italic",
					warnings = "italic",
					information = "italic",
				},
				underlines = {
					errors = "underline",
					hints = "underline",
					warnings = "underline",
					information = "underline",
				},
			},
			lsp_trouble = true,
			lsp_saga = true,
			gitgutter = false,
			gitsigns = true,
			telescope = true,
			nvimtree = { enabled = true, show_root = true },
			which_key = true,
			indent_blankline = { enabled = true, colored_indent_levels = false },
			dashboard = true,
			neogit = false,
			vim_sneak = false,
			fern = false,
			barbar = false,
			bufferline = true,
			markdown = true,
			lightspeed = false,
			ts_rainbow = true,
			hop = true,
		},
	})
end

-- function config.lualine()
-- 	local gps = require("nvim-gps")

-- 	local function gps_content()
-- 		if gps.is_available() then
-- 			return gps.get_location()
-- 		else
-- 			return ""
-- 		end
-- 	end
-- 	local mini_sections = {
-- 		lualine_a = {},
-- 		lualine_b = {},
-- 		lualine_c = {},
-- 		lualine_x = {},
-- 		lualine_y = {},
-- 		lualine_z = { "location" },
-- 	}
-- 	local simple_sections = {
-- 		lualine_a = { "mode" },
-- 		lualine_b = { "filetype" },
-- 		lualine_c = {},
-- 		lualine_x = {},
-- 		lualine_y = {},
-- 		lualine_z = { "location" },
-- 	}
-- 	local minimap = {
-- 		sections = mini_sections,
-- 		filetypes = { "minimap" },
-- 	}
-- 	local aerial = {
-- 		sections = mini_sections,
-- 		filetypes = { "aerial" },
-- 	}
-- 	local dapui_scopes = {
-- 		sections = simple_sections,
-- 		filetypes = { "dapui_scopes" },
-- 	}

-- 	local dapui_breakpoints = {
-- 		sections = simple_sections,
-- 		filetypes = { "dapui_breakpoints" },
-- 	}

-- 	local dapui_stacks = {
-- 		sections = simple_sections,
-- 		filetypes = { "dapui_stacks" },
-- 	}

-- 	local dapui_watches = {
-- 		sections = simple_sections,
-- 		filetypes = { "dapui_watches" },
-- 	}

-- 	require("lualine").setup({
-- 		options = {
-- 			icons_enabled = true,
-- 			theme = "catppuccin",
-- 			disabled_filetypes = {},
-- 			component_separators = "|",
-- 			section_separators = { left = "", right = "" },
-- 		},
-- 		sections = {
-- 			lualine_a = { "mode" },
-- 			lualine_b = { { "branch" }, { "diff" } },
-- 			lualine_c = {
-- 				{ "lsp_progress" },
-- 				{ gps_content, cond = gps.is_available },
-- 			},
-- 			lualine_x = {
-- 				{
-- 					"diagnostics",
-- 					sources = { "nvim_diagnostic" },
-- 					symbols = { error = " ", warn = " ", info = " " },
-- 				},
-- 			},
-- 			lualine_y = {
-- 				{
-- 					"filetype",
-- 					"encoding",
-- 				},
-- 				{
-- 					"fileformat",
-- 					icons_enabled = true,
-- 					symbols = {
-- 						unix = "LF",
-- 						dos = "CRLF",
-- 						mac = "CR",
-- 					},
-- 				},
-- 			},
-- 			lualine_z = { "progress", "location" },
-- 		},
-- 		inactive_sections = {
-- 			lualine_a = {},
-- 			lualine_b = {},
-- 			lualine_c = { "filename" },
-- 			lualine_x = { "location" },
-- 			lualine_y = {},
-- 			lualine_z = {},
-- 		},
-- 		tabline = {},
-- 		extensions = {
-- 			"quickfix",
-- 			"nvim-tree",
-- 			"toggleterm",
-- 			"fugitive",
-- 			minimap,
-- 			aerial,
-- 			dapui_scopes,
-- 			dapui_breakpoints,
-- 			dapui_stacks,
-- 			dapui_watches,
-- 		},
-- 	})
-- end

function config.lualine()
	local gps = require("nvim-gps")

	local function gps_content()
		if gps.is_available() then
			return gps.get_location()
		else
			return ""
		end
	end
	local colors = {
		bg       = '#202328',
		fg       = '#bbc2cf',
		yellow   = '#ECBE7B',
		cyan     = '#008080',
		darkblue = '#081633',
		green    = '#98be65',
		orange   = '#FF8800',
		violet   = '#a9a1e1',
		magenta  = '#c678dd',
		blue     = '#51afef',
		red      = '#ec5f67',
	}


	local conditions = {
		buffer_not_empty = function()
		return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
		end,
		hide_in_width = function()
		return vim.fn.winwidth(0) > 80
		end,
		check_git_workspace = function()
		local filepath = vim.fn.expand('%:p:h')
		local gitdir = vim.fn.finddir('.git', filepath .. ';')
		return gitdir and #gitdir > 0 and #gitdir < #filepath
		end,
	}
	local symbols_outline = {
		sections = {
		lualine_a = { "mode" },
		lualine_b = { "filetype" },
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = { "location" },
		},
		filetypes = { "Outline" },
	}
	local mini_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = { "location" },
	}
	local minimap = {
		sections = mini_sections,
		filetypes = { "minimap" },
	}
	local aerial = {
		sections = mini_sections,
		filetypes = { "aerial" },
	}
	local dapui_scopes = {
		sections = {
			lualine_a = {},
			lualine_b = { "filetype" },
			lualine_c = {},
			lualine_x = {},
			lualine_y = {},
			lualine_z = { "location" },
		},
		filetypes = { "dapui_scopes" },
	}

	local dapui_breakpoints = {
		sections = {
			lualine_a = {},
			lualine_b = { "filetype" },
			lualine_c = {},
			lualine_x = {},
			lualine_y = {},
			lualine_z = { "location" },
		},
		filetypes = { "dapui_breakpoints" },
	}

	local dapui_stacks = {
		sections = {
			lualine_a = {},
			lualine_b = { "filetype" },
			lualine_c = {},
			lualine_x = {},
			lualine_y = {},
			lualine_z = { "location" },
		},
		filetypes = { "dapui_stacks" },
	}

	local dapui_watches = {
		sections = {
			lualine_a = {},
			lualine_b = { "filetype" },
			lualine_c = {},
			lualine_x = {},
			lualine_y = {},
			lualine_z = { "location" },
		},
		filetypes = { "dapui_watches" },
	}

	  -- Config
	  local config = {
		options = {
		  -- Disable sections and component separators
		  component_separators = '',
		  section_separators = {left = "", right = ""},
		  theme = "catppuccin"
		--   theme = {
		--     -- We are going to use lualine_c an lualine_x as left and
		--     -- right section. Both are highlighted by c theme .  So we
		--     -- are just setting default looks o statusline
		--     normal = { c = { fg = colors.fg, bg = colors.bg } },
		--     inactive = { c = { fg = colors.fg, bg = colors.bg } },
		--   },
		},

		sections = {
		  -- these are to remove the defaults
		  lualine_a = {'mode'},
		  lualine_b = {},
		  lualine_y = {"filetype", "encoding", "fileformat"},
		  lualine_z = { '%l:%c', '%p%%/%L'},
		  -- These will be filled later
		  lualine_c = {},
		  lualine_x = {},
		},
		inactive_sections = {
		  -- these are to remove the defaults
		  lualine_a = {},
		  lualine_b = {},
		  lualine_y = {},
		  lualine_z = {},
		  lualine_c = {},
		  lualine_x = {},
		},
				extensions = {
			  "quickfix",
			  "nvim-tree",
			  "toggleterm",
			  "fugitive",
			  minimap,
			aerial,
  			dapui_scopes,
			dapui_breakpoints,
			dapui_stacks,
			dapui_watches,
		  },
	  }

	  -- Inserts a component in lualine_c at left section
	  local function ins_left(component)
		table.insert(config.sections.lualine_c, component)
	  end

	  -- Inserts a component in lualine_x ot right section
	  local function ins_right(component)
		table.insert(config.sections.lualine_x, component)
	  end

	ins_left({
		'filename',
		cond = conditions.buffer_not_empty,
		-- color = { fg = colors.green, gui = 'bold' },
		color = { fg = colors.magenta, gui = 'bold' },
	})
	ins_left({
		-- filesize component
		'filesize',
		cond = conditions.buffer_not_empty,
		color = { fg = colors.cyan, gui = 'bold' },
		})

		ins_left({
			-- "lsp_progress",
			gps_content, cond = gps.is_available,
			color = { fg = colors.magenta, gui = 'bold' }
		})

		--   ins_left({ '%l:%c  %p%%/%L',
		--   color = { fg = colors.magenta, gui = 'bold' },
		-- })

		--   ins_left({ 'progress', color = { fg = colors.fg, gui = 'bold' } })

	ins_right({
		'diagnostics',
		sources = { 'nvim_lsp' },
		symbols = { error = ' ', warn = ' ', info = '  ' },
		diagnostics_color = {
		color_error = { fg = colors.red },
		color_warn = { fg = colors.yellow },
		color_info = { fg = colors.cyan },
			},
		})

		  -- Insert mid section. You can make any number of sections in neovim :)
		  -- for lualine it's any number greater then 2
		--   ins_left({
		-- 	function()
		-- 	  return '%='
		-- 	end,
		--   })

		  ins_left({
			-- Lsp server name .
			function()
			  local msg = 'No Active Lsp'
			  local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
			  local clients = vim.lsp.get_active_clients()
			  if next(clients) == nil then
				return msg
			  end
			  for _, client in ipairs(clients) do
				local filetypes = client.config.filetypes
				if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
				  return client.name
				end
			  end
			  return msg
			end,
			icon = ' LSP:',
			color = { fg = '#ff8800', gui = 'bold' },
		  })

		  ins_right({
			'branch',
			icon = '',
			color = { fg = colors.violet, gui = 'bold' },
		  })

		  ins_right({
			'diff',
			-- Is it me or the symbol for modified us really weird
			symbols = { added = ' ', modified = '柳 ', removed = ' ' },
			diff_color = {
			  added = { fg = colors.red },
			  modified = { fg = colors.orange },
			  removed = { fg = colors.magenta },
			},
			cond = conditions.hide_in_width,
		  })


		--   ins_right({
		--     function()
		--       return '▊'
		--     end,
		--     color = { fg = colors.blue },
		--     padding = { left = 1 },
		--   })

		  -- Now don't forget to initialize lualine
		--   lualine.setup(config)
		  require("lualine").setup(config)
		end

function config.nvim_tree()
	require("nvim-tree").setup({
		disable_netrw = true,
		hijack_netrw = true,
		open_on_setup = false,
		ignore_ft_on_setup = {},
		auto_close = true,
		open_on_tab = false,
		hijack_cursor = true,
		update_cwd = false,
		update_to_buf_dir = { enable = true, auto_open = true },
		diagnostics = {
			enable = false,
			icons = { hint = "", info = "", warning = "", error = "" },
		},
		update_focused_file = {
			enable = true,
			update_cwd = true,
			ignore_list = {},
		},
		system_open = { cmd = nil, args = {} },
		filters = { dotfiles = false, custom = {} },
		git = { enable = true, ignore = true, timeout = 500 },
		view = {
			width = 30,
			height = 30,
			hide_root_folder = false,
			side = "left",
			auto_resize = false,
			mappings = { custom_only = false, list = {} },
			number = false,
			relativenumber = false,
			signcolumn = "yes",
		},
		trash = { cmd = "trash", require_confirm = true },
	})
end

function config.nvim_bufferline()
	require("bufferline").setup({
		options = {
			number = "none",
			modified_icon = "",
			buffer_close_icon = "",
			left_trunc_marker = "",
			right_trunc_marker = "",
			max_name_length = 14,
			max_prefix_length = 13,
			tab_size = 20,
			show_buffer_close_icons = true,
			show_buffer_icons = true,
			show_tab_indicators = true,
			diagnostics = "nvim_lsp",
			always_show_bufferline = true,
			separator_style = "thin",
			offsets = {
				{
					filetype = "NvimTree",
					text = "File Explorer",
					text_align = "center",
					padding = 1,
				},
			},
		},
	})
end

function config.gitsigns()
	require("gitsigns").setup({
		signs = {
			add = {
				hl = "GitSignsAdd",
				text = "│",
				numhl = "GitSignsAddNr",
				linehl = "GitSignsAddLn",
			},
			change = {
				hl = "GitSignsChange",
				text = "│",
				numhl = "GitSignsChangeNr",
				linehl = "GitSignsChangeLn",
			},
			delete = {
				hl = "GitSignsDelete",
				text = "_",
				numhl = "GitSignsDeleteNr",
				linehl = "GitSignsDeleteLn",
			},
			topdelete = {
				hl = "GitSignsDelete",
				text = "‾",
				numhl = "GitSignsDeleteNr",
				linehl = "GitSignsDeleteLn",
			},
			changedelete = {
				hl = "GitSignsChange",
				text = "~",
				numhl = "GitSignsChangeNr",
				linehl = "GitSignsChangeLn",
			},
		},
		keymaps = {
			-- Default keymap options
			noremap = true,
			buffer = true,
			["n ]g"] = {
				expr = true,
				"&diff ? ']g' : '<cmd>lua require\"gitsigns\".next_hunk()<CR>'",
			},
			["n [g"] = {
				expr = true,
				"&diff ? '[g' : '<cmd>lua require\"gitsigns\".prev_hunk()<CR>'",
			},
			["n <leader>hs"] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
			["v <leader>hs"] = '<cmd>lua require"gitsigns".stage_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
			["n <leader>hu"] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
			["n <leader>hr"] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
			["v <leader>hr"] = '<cmd>lua require"gitsigns".reset_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
			["n <leader>hR"] = '<cmd>lua require"gitsigns".reset_buffer()<CR>',
			["n <leader>hp"] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
			["n <leader>hb"] = '<cmd>lua require"gitsigns".blame_line(true)<CR>',
			-- Text objects
			["o ih"] = ':<C-U>lua require"gitsigns".text_object()<CR>',
			["x ih"] = ':<C-U>lua require"gitsigns".text_object()<CR>',
		},
		watch_gitdir = { interval = 1000, follow_files = true },
		current_line_blame = true,
		current_line_blame_opts = { delay = 1000, virtual_text_pos = "eol" },
		sign_priority = 6,
		update_debounce = 100,
		status_formatter = nil, -- Use default
		word_diff = false,
		diff_opts = { internal = true },
	})
end

function config.indent_blankline()
	vim.opt.termguicolors = true
	vim.opt.list = true
	require("indent_blankline").setup({
		char = "│",
		show_first_indent_level = true,
		filetype_exclude = {
			"startify",
			"dashboard",
			"dotooagenda",
			"log",
			"fugitive",
			"gitcommit",
			"packer",
			"vimwiki",
			"markdown",
			"json",
			"txt",
			"vista",
			"help",
			"todoist",
			"NvimTree",
			"peekaboo",
			"git",
			"TelescopePrompt",
			"undotree",
			"flutterToolsOutline",
			"", -- for all buffers without a file type
		},
		buftype_exclude = { "terminal", "nofile" },
		show_trailing_blankline_indent = false,
		show_current_context = true,
		context_patterns = {
			"class",
			"function",
			"method",
			"block",
			"list_literal",
			"selector",
			"^if",
			"^table",
			"if_statement",
			"while",
			"for",
			"type",
			"var",
			"import",
		},
		space_char_blankline = " ",
	})
	-- because lazy load indent-blankline so need readd this autocmd
	vim.cmd("autocmd CursorMoved * IndentBlanklineRefresh")
end

return config
