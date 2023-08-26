local bind = require("keymap.bind")
local map_cr = bind.map_cr
local addtitle = require("user.keymap.authorinfo").addtitle
print("hhh")
print("hhh")
return {
	["n|<F4>"] = map_cr(addtitle):with_silent():with_noremap():with_desc("editn:  file using sudo"),
}
