local lang = {}

-- lang["fatih/vim-go"] = {
-- 	lazy = true,
-- 	ft = "go",
-- 	build = ":GoInstallBinaries",
-- 	config = require("lang.vim-go"),
-- }
-- lang["simrat39/rust-tools.nvim"] = {
-- 	lazy = true,
-- 	ft = "rust",
-- 	config = require("lang.rust-tools"),
-- 	dependencies = { "nvim-lua/plenary.nvim" },
-- }
-- lang["kristijanhusak/orgmode.nvim"] = {
-- 	opt = true,
-- 	ft = "org",
-- 	config = conf.lang_org,
-- }
lang["nvim-orgmode/orgmode"] = {
	lazy = true,
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	ft = "org",
	config = require("lang.orgmode"),
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
-- lang["Saecki/crates.nvim"] = {
-- 	lazy = true,
-- 	event = "BufReadPost Cargo.toml",
-- 	config = require("lang.crates"),
-- 	dependencies = { "nvim-lua/plenary.nvim" },
-- }
lang["iamcco/markdown-preview.nvim"] = {
	lazy = true,
	ft = "markdown",
	build = ":call mkdp#util#install()",
}
lang["chrisbra/csv.vim"] = {
	lazy = true,
	ft = "csv",
}
lang["lervag/vimtex"] = { lazy = true, ft = "tex" }
lang["vigoux/ltex-ls.nvim"] = {
	config = require("completion.servers.ltex"),
	ft = { "latex", "tex", "bib", "markdown", "gitcommit", "text" },
}
return lang
