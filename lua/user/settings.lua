-- Please check `lua/core/settings.lua` to view the full list of configurable settings
local settings = {}

settings["use_ssh"] = true
settings["use_copilot"] = false
settings["colorscheme"] = "onedark"

-- Set the plugins to disable here.
-- Example: "Some-User/A-Repo"
---@type string[]
settings["disabled_plugins"] = {
	-- ui
	"Jint-lzxy/nvim", -- set in lua/modules/plugins/ui.lua
	"nvim-lualine/lualine.nvim",
	-- editor
	"smoka7/hop.nvim",
	"lambdalisue/suda.vim",
	"olimorris/persisted.nvim",
	-- local-highlight not work, so use vim-illuminate
	"tzachar/local-highlight.nvim",
	-- lang
	"ray-x/go.nvim",
	"mrcjkb/rustaceanvim",
	"Saecki/crates.nvim",
	-- tool
	"goolord/alpha-nvim",
	"gelguy/wilder.nvim",
}

return settings
