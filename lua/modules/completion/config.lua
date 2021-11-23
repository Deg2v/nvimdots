local config = {}

function config.nvim_lsp() require("modules.completion.lspconfig") end

function config.lightbulb()
    vim.cmd [[autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()]]
end

function config.autopairs()
    local npairs = require("nvim-autopairs")
    npairs.setup({
        map_bs = false,
        map_cr = false,
        check_ts = true,
        enable_check_bracket_line = false,
        ts_config = {
            lua = {"string"},
            -- it will not add a pair on that treesitter node
            javascript = {"template_string"},
            java = false
            -- don't check treesitter on java
        },
        fast_wrap = {
            map = "<M-e>",
            chars = {"{", "[", "(", '"', "'"},
            pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
            offset = 0, -- Offset from pattern match
            end_key = "$",
            keys = "qwertyuiopzxcvbnmasdfghjkl",
            check_comma = true,
            highlight = "Search",
            highlight_grey = "Comment"
        }
    })
end

function config.coq_3q()
    require("coq_3q") {
        {src = "nvimlua", short_name = "nLUA"},
        {src = "vimtex", short_name = "vTEX"},
        {src = "copilot", short_name = "COP", tmp_accept_key = "<c-r>"}
    }
end

return config
