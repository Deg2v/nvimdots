local settings = {}

settings["use_ssh"] = true
settings["format_disabled_dirs"] = {
	vim.env.HOME .. "/git/Hypr",
}

return settings
