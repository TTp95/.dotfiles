
require('nvim-treesitter.configs').setup({
    ensure_installed = "all",
    sync_install = false,
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
})

require("treesitter-context").setup({})
