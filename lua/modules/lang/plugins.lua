local lang = {}
local conf = require("modules.lang.config")

lang["nvim-orgmode/orgmode"] = {
	lazy = true,
	after = "nvim-treesitter",
	ft = "org",
	config = conf.lang_org,
}
-- lang["kristijanhusak/orgmode.nvim"] = {
-- 	opt = true,
-- 	ft = "org",
-- 	config = conf.lang_org,
-- }
-- lang["fatih/vim-go"] = {
-- 	lazy = true,
-- 	ft = "go",
-- 	build = ":GoInstallBinaries",
-- 	config = conf.lang_go,
-- }
-- lang["simrat39/rust-tools.nvim"] = {
-- 	lazy = true,
-- 	ft = "rust",
-- 	config = conf.rust_tools,
-- 	dependencies = { { "nvim-lua/plenary.nvim" } },
-- }
lang["iamcco/markdown-preview.nvim"] = {
	lazy = true,
	ft = "markdown",
	build = "cd app && yarn install",
}
lang["chrisbra/csv.vim"] = {
	lazy = true,
	ft = "csv",
}
lang["lervag/vimtex"] = { lazy = true, ft = "tex" }
return lang
