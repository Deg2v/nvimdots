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
	-- lang
	"fatih/vim-go",
	"simrat39/rust-tools.nvim",
	"Saecki/crates.nvim",
	-- tool
	"gelguy/wilder.nvim",
	"goolord/alpha-nvim",
}
return settings
