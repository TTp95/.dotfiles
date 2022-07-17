require'nvim-treesitter.configs'.setup {
    indent = {
        enable = true
    },
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = true,
    },
    incremental_selection = {
        enable = true
    },
    textobjects = {
        enable = true
    },
}

require("treesitter-context").setup({
    enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
    throttle = true, -- Throttles plugin updates (may improve performance)
    max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
    show_all_context = false,
    patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
        -- For all filetypes
        -- Note that setting an entry here replaces all other patterns for this entry.
        -- By setting the 'default' entry below, you can control which nodes you want to
        -- appear in the context window.
        default = {
            "function",
            "method",
            "for",
            "while",
            "if",
            "switch",
            "case",
        },

        rust = {
            "loop_expression",
            "impl_item",
        },

    },
})
