return{

    -- Color Scheme
    {
        'folke/tokyonight.nvim',
        lazy = false,
        priority = 1000,
        config = function()
            --Color Scheme
            vim.g.tokyonight_style = 'night'
            --Load the colorscheme
            vim.cmd('colorscheme tokyonight-night')
        end
    },

    -- undotree
    {'mbbill/undotree'},

    -- Harpoon
    {'ThePrimeagen/harpoon'},

    -- Git
    {'tpope/vim-fugitive'},
    {'airblade/vim-gitgutter'},

    -- Telescope
    {
        'nvim-telescope/telescope.nvim',
        dependencies = {
            'nvim-lua/popup.nvim',
            'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope-dap.nvim',
            {'nvim-telescope/telescope-fzf-native.nvim', build = 'make'},
        },
    },

    -- Treesitter
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        dependencies = {
            'nvim-treesitter/playground',
            'nvim-treesitter/nvim-treesitter-context',
        }
    },

    -- Lsp-Zero
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        dependencies = {
            -- LSP Support
            'neovim/nvim-lspconfig',
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',

            -- Autocompletion
            'hrsh7th/nvim-cmp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-nvim-lua',
            'saadparwaiz1/cmp_luasnip',
            'onsails/lspkind-nvim',
            'ray-x/lsp_signature.nvim',
            {
                'glepnir/lspsaga.nvim',
                event = 'LspAttach',
                config = function()
                    require('lspsaga').setup({})
                end,
                dependencies = {
                    {'nvim-tree/nvim-web-devicons'},
                    --Please make sure you install markdown and markdown_inline parser
                    {'nvim-treesitter/nvim-treesitter'}
                }
            },

            -- DAP
            'mfussenegger/nvim-dap',
            'rcarriga/nvim-dap-ui',
            'theHamsta/nvim-dap-virtual-text',

            -- Snippets
            'L3MON4D3/LuaSnip',
            'rafamadriz/friendly-snippets',
        }
    },

    -- Tabnine
    {'tzachar/cmp-tabnine', build = './install.sh',},

    -- Trouble
    {
        "folke/trouble.nvim",
        config = function()
            require("trouble").setup {
                icons = false,
            }
        end
    },

    -- Julia Lang
    {'JuliaEditorSupport/julia-vim'},

    -- Rust Lang
    {'simrat39/rust-tools.nvim'},


    -- Dev
    {'numToStr/Comment.nvim'},
    {'hoob3rt/lualine.nvim'},
    {'nvim-tree/nvim-web-devicons'},
    {'nvim-tree/nvim-tree.lua'},
    {'lukas-reineke/indent-blankline.nvim'},

    -- Writing
    {'rhysd/vim-grammarous'},
    {'lervag/vimtex'},
    {'iamcco/markdown-preview.nvim', build = function() vim.fn["mkdp#util#install"]() end},

}
