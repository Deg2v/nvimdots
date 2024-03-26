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
my["nvimdev/dashboard-nvim"] = {
	event = "BufWinEnter",
	config = require("custom.dashboard"),
	dependencies = { { "nvim-tree/nvim-web-devicons" } },
}

-- editor
-- my["folke/flash.nvim"] = {
-- 	event = "VeryLazy",
-- 	---Flash.Config
-- 	opts = {
-- 		modes = {
-- 			search = {
-- 				enabled = true,
-- 				highlight = { backdrop = false },
-- 				search = {
-- 					incremental = true,
-- 					trigger = ";",
-- 				},
-- 			},
-- 		},
-- 	},
--   -- stylua: ignore
--     keys = {
--     { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
--     { "S", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
--     { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
--     { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
--     { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
--   },
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

-- tool
my["folke/todo-comments.nvim"] = {
	lazy = false,
	config = require("custom.todo_comments"),
	dependencies = {
		{ "nvim-lua/plenary.nvim", lazy = false },
	},
}

return my
