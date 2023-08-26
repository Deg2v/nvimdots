local my = {}
-- ui
my["navarasu/onedark.nvim"] = { lazy = false, config = require("custom.onedark") }
my["glepnir/galaxyline.nvim"] = {
	lazy = true,
	event = { "BufReadPost", "BufAdd", "BufNewFile" },
	branch = "main",
	config = require("custom.galaxyline"),
	dependencies = "nvim-tree/nvim-web-devicons",
}
-- ui["nvimdev/dashboard-nvim"] = {
-- 	event = "BufWinEnter",
-- 	config = require("ui.dashboard"),
-- 	dependencies = { { "nvim-tree/nvim-web-devicons" } },
-- }

-- editor
my["folke/flash.nvim"] = {
	event = "VeryLazy",
	---@type Flash.Config
	opts = {},
  -- stylua: ignore
    keys = {
    { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    { "S", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
  },
}
-- editor["ggandor/leap.nvim"] = {
-- 	lazy = true,
-- 	event = "BufReadPost",
-- 	dependencies = { { "tpope/vim-repeat" } },
-- 	config = require("editor.leap"),
-- }
-- editor["ggandor/flit.nvim"] = {
-- 	lazy = true,
-- 	event = { "BufReadPost", "BufAdd", "BufNewFile" },
-- 	dependencies = "leap.nvim",
-- 	config = require("editor.flit"),
-- }

--lang
my["nvim-orgmode/orgmode"] = {
	lazy = true,
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	ft = "org",
	config = require("custom.orgmode"),
}

my["lervag/vimtex"] = { lazy = true, ft = "tex" }
my["vigoux/ltex-ls.nvim"] = {
	config = require("custom.ltex"),
	ft = { "latex", "tex", "bib", "markdown", "gitcommit", "text" },
}
-- lang["nvim-neorg/neorg"] = {
-- 	ft = "org",
-- 	build = ":Neorg sync-parsers",
-- 	dependencies = { "nvim-lua/plenary.nvim" },
-- 	config = function()
-- 		require("neorg").setup({
-- 			load = {
-- 				["core.defaults"] = {}, -- Loads default behaviour
-- 				["core.concealer"] = {}, -- Adds pretty icons to your documents
-- 				["core.dirman"] = { -- Manages Neorg workspaces
-- 					config = {
-- 						workspaces = {
-- 							notes = "~/notes",
-- 						},
-- 					},
-- 				},
-- 			},
-- 		})
-- 	end,
-- }
-- lang["kristijanhusak/orgmode.nvim"] = {
-- 	opt = true,
-- 	ft = "org",
-- 	config = conf.lang_org,
-- }

-- tool
my["folke/todo-comments.nvim"] = {
	lazy = false,
	config = require("custom.todo_comments"),
	dependencies = {
		{ "nvim-lua/plenary.nvim", lazy = false },
	},
}
-- tools["glepnir/template.nvim"] = {
-- 	-- opt = true,
-- 	config = conf.template_nvim,
-- 	-- event = "CmdlineEnter",
-- }

return my
