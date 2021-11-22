local completion = {}
local conf = require("modules.completion.config")

completion["neovim/nvim-lspconfig"] = {
    opt = true,
    event = "BufReadPre",
    config = conf.nvim_lsp
}
completion["williamboman/nvim-lsp-installer"] = {
    opt = true,
    after = "nvim-lspconfig"
}
completion["tami5/lspsaga.nvim"] = {opt = true, after = "nvim-lspconfig"}
completion["kosayoda/nvim-lightbulb"] = {
    opt = true,
    after = "nvim-lspconfig",
    config = conf.lightbulb
}
completion["ray-x/lsp_signature.nvim"] = {opt = true, after = "nvim-lspconfig"}
completion["ms-jpq/coq_nvim"] = {
    opt = true,
    after = "nvim-lspconfig",
    branch = "coq",
    requires = {
        {"ms-jpq/coq.artifacts", branch = "artifacts"},
        {"ms-jpq/coq.thirdparty", branch = "3p", config = conf.coq_3p}
    }
}
completion["windwp/nvim-autopairs"] = {
    after = "coq_nvim",
    config = conf.autopairs
}
completion["github/copilot.vim"] = {opt = true, cmd = "Copilot"}

return completion
