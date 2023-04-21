require('Comment').setup({
    ---LHS of toggle mappings in NORMAL mode
    toggler = {
        ---Line-comment toggle keymap
        line = '\\',
        ---Block-comment toggle keymap
        block = '<leader>=',
    },
    ---LHS of operator-pending mappings in NORMAL and VISUAL mode
    opleader = {
        ---Line-comment keymap
        line = '\\',
        ---Block-comment keymap
        block = '<leader>=',
    },
})
