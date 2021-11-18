local completion = {}
local conf = require("modules.completion.config")

completion["neoclide/coc.nvim"] = {
    opt = true,
    event = "BufRead",
    branch = "release"
}
completion["github/copilot.vim"] = {opt = true, cmd = "Copilot"}

return completion
