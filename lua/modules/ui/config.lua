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

function config.nord()
	vim.g.nord_contrast = true
	vim.g.nord_borders = false
	vim.g.nord_cursorline_transparent = true
	vim.g.nord_disable_background = false
	vim.g.nord_enable_sidebar_background = true
	vim.g.nord_italic = false
end

function config.onedarkpro()
	require("onedarkpro").setup({
  -- Theme can be overwritten with 'onedark' or 'onelight' as a string
  theme = function()
    if vim.o.background == "dark" then
      return "onedark"
    else
      return "onelight"
    end
  end,
  colors = {}, -- Override default colors by specifying colors for 'onelight' or 'onedark' themes
  hlgroups = {}, -- Override default highlight groups
  filetype_hlgroups = {}, -- Override default highlight groups for specific filetypes
  plugins = { -- Override which plugins highlight groups are loaded
      native_lsp = true,
      polygot = true,
      treesitter = true,
      -- NOTE: Other plugins have been omitted for brevity
  },
  styles = {
      strings = "NONE", -- Style that is applied to strings
      comments = "italic", -- Style that is applied to comments
      keywords = "italic", -- Style that is applied to keywords
      functions = "bold,italic", -- Style that is applied to functions
      variables = "italic", -- Style that is applied to variables
  },
  options = {
      bold = true, -- Use the themes opinionated bold styles?
      italic = true, -- Use the themes opinionated italic styles?
      underline = true, -- Use the themes opinionated underline styles?
      undercurl = true, -- Use the themes opinionated undercurl styles?
      cursorline = true, -- Use cursorline highlighting?
      transparency = true, -- Use a transparent background?
      terminal_colors = true, -- Use the theme's colors for Neovim's :terminal?
      window_unfocussed_color = true, -- When the window is out of focus, change the normal background?
  }
})
end

function config.onedark()
	-- Lua
require('onedark').setup({
    -- Main options --
    style = 'dark', -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
    transparent = false,  -- Show/hide background
    term_colors = true, -- Change terminal color as per the selected theme style
    ending_tildes = false, -- Show the end-of-buffer tildes. By default they are hidden
    -- toggle theme style ---
    toggle_style_key = '<leader>ts', -- Default keybinding to toggle
    toggle_style_list = {'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light'}, -- List of styles to toggle between

    -- Change code style ---
    -- Options are italic, bold, underline, none
    -- You can configure multiple style with comma seperated, For e.g., keywords = 'italic,bold'
    code_style = {
        comments = 'italic',
        keywords = 'italic',
        functions = 'bold,italic',
        strings = 'none',
        variables = 'italic'
    },

    -- Custom Highlights --
    colors = {
		bright_orange = "#ff8800",    -- define a new color
    -- green = '#00ffaa',            -- redefine an existing color
	}, -- Override default colors
    highlights = {
		TSVariable = {fg = '#e06150'},
	}, -- Override highlight groups

    -- Plugins Config --
    diagnostics = {
        darker = true, -- darker colors for diagnostic
        undercurl = true,   -- use undercurl instead of underline for diagnostics
        background = true,    -- use background color for virtual text
    },
})
end

function config.nvcode_color_schemes()
	require('nvim-treesitter.configs').setup ({
		ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
		highlight = {
		  enable = true,              -- false will disable the whole extension
		  disable = { "rust" },  -- list of language that will be disabled
		},
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

	local custom_fname = require('lualine.components.filename'):extend()
	local highlight = require'lualine.highlight'
	-- local default_status_colors = { saved = '#228B22', modified = '#C70039' }
	local default_status_colors = { saved = '#98be65', modified = '#C70039' }

	function custom_fname:init(options)
	  custom_fname.super.init(self, options)
	  self.status_colors = {
		saved = highlight.create_component_highlight_group(
		  {fg = default_status_colors.saved}, 'filename_status_saved', self.options),
		modified = highlight.create_component_highlight_group(
		  {fg = default_status_colors.modified}, 'filename_status_modified', self.options),
	  }
	  if self.options.color == nil then self.options.color = '' end
	end

	function custom_fname:update_status()
	  local data = custom_fname.super.update_status(self)
	  data = highlight.component_format_highlight(vim.bo.modified
												  and self.status_colors.modified
												  or self.status_colors.saved) .. data
	  return data
	end

	-- require'lualine'.setup {
	--   lualine_c = {custom_fname},
	-- }
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
	local minimap = {
		sections = mini_sections,
		filetypes = { "minimap" },
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
	  local config1 = {
		options = {
		  -- Disable sections and component separators
		  icons_enabled = true,
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
		  lualine_y = {{"filetype", "encoding",}, {"fileformat",
		  icons_enabled = true,
		  symbols = {
			  unix = "LF",
			  dos = "CRLF",
			  mac = "CR",
		  },
		},
	},

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
		  lualine_c = { "filename" },
		  lualine_x = { "location" },
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

	ins_left({
		'diagnostics',
		sources = { 'nvim_diagnostic' },
		symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' },
		diagnostics_color = {
		color_error = { fg = '#e32636' },
		warn = { fg = '#ffa500' },
		info = { fg = '#ebdbb2' },
		hint = {fg = colors.magenta}
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
				local filetypes = client.config1.filetypes
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

		  require("lualine").setup(config1)
		end

function config.nvim_gps()
	require("nvim-gps").setup({
		icons = {
			["class-name"] = " ", -- Classes and class-like objects
			["function-name"] = " ", -- Functions
			["method-name"] = " ", -- Methods (functions inside class-like objects)
		},
		languages = {
			-- You can disable any language individually here
			["c"] = true,
			["cpp"] = true,
			["go"] = true,
			["java"] = true,
			["javascript"] = true,
			["lua"] = true,
			["python"] = true,
			["rust"] = true,
		},
		separator = " > ",
	})
end

function config.nvim_tree()
	require("nvim-tree").setup({
		disable_netrw = true,
		hijack_netrw = true,
		open_on_setup = false,
		ignore_ft_on_setup = {},
		open_on_tab = false,
		hijack_cursor = true,
		update_cwd = false,
		update_to_buf_dir = { enable = true, auto_open = true },
		diagnostics = {
			enable = false,
			icons = { hint = "ﯦ", info = "", warning = "", error = "" },
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
