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
	"Jint-lzxy/nvim",
	"sainnhe/edge",
	"nvim-lualine/lualine.nvim",
	"shaunsingh/nord.nvim",
	-- editor
	"rhysd/clever-f.vim",
	"smoka7/hop.nvim",
	-- lang
	"fatih/vim-go",
	"simrat39/rust-tools.nvim",
	"Saecki/crates.nvim",
	-- tool
	"gelguy/wilder.nvim",
	"goolord/alpha-nvim",
}
return settings
