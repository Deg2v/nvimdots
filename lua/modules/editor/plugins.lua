local editor = {}
local conf = require("modules.editor.config")

editor["junegunn/vim-easy-align"] = {
	lazy = true,
	cmd = "EasyAlign",
}
editor["RRethy/vim-illuminate"] = {
	lazy = true,
	event = "BufReadPost",
	config = conf.illuminate,
}
-- editor["terrortylor/nvim-comment"] = {
-- 	opt = false,
-- 	config = function()
-- 		require("nvim_comment").setup({
-- 			hook = function()
-- 				require("ts_context_commentstring.internal").update_commentstring()
-- 			end,
-- 		})
-- 	end,
-- }
editor["numToStr/Comment.nvim"] = {
	lazy = false,
	config = conf.comment,
}
-- editor["terrortylor/nvim-comment"] = {
-- 	lazy = true,
-- 	event = { "BufNewFile", "BufReadPre" },
-- 	config = conf.nvim_comment,
editor["nvim-treesitter/nvim-treesitter"] = {
	lazy = true,
	build = ":TSUpdate",
	event = "BufReadPost",
	config = conf.nvim_treesitter,
	dependencies = {
		{ "nvim-treesitter/nvim-treesitter-textobjects" },
		{ "p00f/nvim-ts-rainbow" },
		{ "JoosepAlviste/nvim-ts-context-commentstring" },
		{ "mfussenegger/nvim-ts-hint-textobject" },
		{ "andymass/vim-matchup" },
		{ "windwp/nvim-ts-autotag", config = conf.autotag },
		{ "NvChad/nvim-colorizer.lua", config = conf.nvim_colorizer },
		{ "abecodes/tabout.nvim", config = conf.tabout },
	},
}
editor["rainbowhxch/accelerated-jk.nvim"] = {
	lazy = true,
	event = "VeryLazy",
	config = conf.accelerated_jk,
}
-- editor["rhysd/clever-f.vim"] = {
-- 	lazy = true,
-- 	event = "BufReadPost",
-- 	config = conf.clever_f,
-- }
editor["romainl/vim-cool"] = {
	lazy = true,
	event = { "CursorMoved", "InsertEnter" },
}
-- editor["phaazon/hop.nvim"] = {
-- 	opt = true,
-- 	branch = "v2",
-- 	event = "BufReadPost",
-- 	config = conf.hop,
-- }
editor["ggandor/leap.nvim"] = {
	dependencies = { { "tpope/vim-repeat" } },
	config = conf.leap,
}
editor["ggandor/flit.nvim"] = {
	dependencies = "leap.nvim",
	config = conf.flit,
}
-- editor["phaazon/hop.nvim"] = {
-- 	lazy = true,
-- 	branch = "v2",
-- 	event = "BufReadPost",
-- 	config = conf.hop,
editor["karb94/neoscroll.nvim"] = {
	lazy = true,
	event = "BufReadPost",
	config = conf.neoscroll,
}
editor["akinsho/toggleterm.nvim"] = {
	lazy = true,
	event = "UIEnter",
	config = conf.toggleterm,
}
editor["rmagatti/auto-session"] = {
	lazy = true,
	cmd = { "SaveSession", "RestoreSession", "DeleteSession" },
	config = conf.auto_session,
}
editor["max397574/better-escape.nvim"] = {
	lazy = true,
	event = "BufReadPost",
	config = conf.better_escape,
}
<<<<<<< HEAD
-- editor["mfussenegger/nvim-dap"] = {
-- 	opt = true,
-- 	cmd = {
-- 		"DapSetLogLevel",
-- 		"DapShowLog",
-- 		"DapContinue",
-- 		"DapToggleBreakpoint",
-- 		"DapToggleRepl",
-- 		"DapStepOver",
-- 		"DapStepInto",
-- 		"DapStepOut",
-- 		"DapTerminate",
-- 	},
-- 	module = "dap",
-- 	config = conf.dap,
-- }
-- editor["rcarriga/nvim-dap-ui"] = {
-- 	opt = true,
-- 	after = "nvim-dap", -- Need to call setup after dap has been initialized.
-- 	config = conf.dapui,
-- }
editor["tpope/vim-fugitive"] = { opt = true, cmd = { "Git", "G" } }
||||||| 3eb10f2
editor["mfussenegger/nvim-dap"] = {
	opt = true,
	cmd = {
		"DapSetLogLevel",
		"DapShowLog",
		"DapContinue",
		"DapToggleBreakpoint",
		"DapToggleRepl",
		"DapStepOver",
		"DapStepInto",
		"DapStepOut",
		"DapTerminate",
	},
	module = "dap",
	config = conf.dap,
}
editor["rcarriga/nvim-dap-ui"] = {
	opt = true,
	after = "nvim-dap", -- Need to call setup after dap has been initialized.
	config = conf.dapui,
}
editor["tpope/vim-fugitive"] = { opt = true, cmd = { "Git", "G" } }
=======
editor["mfussenegger/nvim-dap"] = {
	lazy = true,
	cmd = {
		"DapSetLogLevel",
		"DapShowLog",
		"DapContinue",
		"DapToggleBreakpoint",
		"DapToggleRepl",
		"DapStepOver",
		"DapStepInto",
		"DapStepOut",
		"DapTerminate",
	},
	config = conf.dap,
	dependencies = {
		{ "rcarriga/nvim-dap-ui", config = conf.dapui },
	},
}
editor["tpope/vim-fugitive"] = {
	lazy = true,
	cmd = { "Git", "G" },
}
>>>>>>> upstream/main
editor["ojroques/nvim-bufdel"] = {
	lazy = true,
	event = "BufReadPost",
}
editor["edluffy/specs.nvim"] = {
	lazy = true,
	event = "CursorMoved",
	config = conf.specs,
}
editor["sindrets/diffview.nvim"] = {
	lazy = true,
	cmd = { "DiffviewOpen", "DiffviewClose" },
}
editor["luukvbaal/stabilize.nvim"] = {
	lazy = true,
	event = "BufReadPost",
}
editor["ibhagwan/smartyank.nvim"] = {
	lazy = true,
	event = "BufReadPost",
	config = conf.smartyank,
}

-- only for fcitx5 user who uses non-English language during coding
-- editor["brglng/vim-im-select"] = {
-- 	lazy = true,
-- 	event = "BufReadPost",
-- 	config = conf.imselect,
-- }

return editor
