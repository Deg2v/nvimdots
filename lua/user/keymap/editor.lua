local bind = require("keymap.bind")
local map_cr = bind.map_cr
local map_cmd = bind.map_cmd
local addtitle = require("user.keymap.authorinfo").addtitle
return {
	-- ["n|q"] = map_cmd("<ESC>"):with_silent():with_desc("disable recording macro in q"), -- FIXME: work in core/mapping.lua, but not work here
	-- ["v|q"] = map_cmd("<ESC>"):with_silent():with_desc("disable recording macro in q"),
	["n|<F4>"] = map_cr(addtitle):with_silent():with_noremap():with_desc("editn:  file using sudo"),
}
