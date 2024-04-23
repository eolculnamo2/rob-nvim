-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
    -- Packer can manage itself
    use("wbthomason/packer.nvim")
    use("gleam-lang/gleam.vim")
    use('nanotee/zoxide.vim')

    -- USED FOR ZOXIDE FUZZY FINDER MENU
    use('nvim-telescope/telescope-ui-select.nvim')
    use('mfussenegger/nvim-jdtls')
    use('ray-x/go.nvim')
    use('ray-x/guihua.lua')
    use('stevearc/dressing.nvim')
    use('ThePrimeagen/vim-be-good')
    use("evanleck/vim-svelte")
    use("itchyny/lightline.vim")
    use("MunifTanjim/prettier.nvim")
    use("vim-test/vim-test")
    use("ElmCast/elm-vim")
    use({
        'mrcjkb/rustaceanvim',
        version = '^4', -- Recommended
        ft = { 'rust' }
    })
    use("APZelos/blamer.nvim")
    use({
        "sindrets/diffview.nvim",
        requires = { { "nvim-lua/plenary.nvim" } },
    })
    use({
        "ggandor/leap.nvim",
        config = function()
            require("leap").add_default_mappings()
        end,
    })
    use({
        "nvim-telescope/telescope.nvim",
        tag = "0.1.4",
        -- or                            , branch = '0.1.x',
        requires = { { "nvim-lua/plenary.nvim" } },
    })
    use({
        "navarasu/onedark.nvim",
        as = "onedark",
        config = function()
            vim.cmd("colorscheme onedark")
        end,
    })
    use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })
    use({
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup()
        end,
    })
    use({
        "VonHeikemen/lsp-zero.nvim",
        branch = "v3.x",
        requires = {
            --- Uncomment these if you want to manage LSP servers from neovim
            { "williamboman/mason.nvim" },
            { "williamboman/mason-lspconfig.nvim" },

            -- LSP Support
            { "neovim/nvim-lspconfig" },
            -- Autocompletion
            { "hrsh7th/nvim-cmp" },
            { "hrsh7th/cmp-nvim-lsp" },
            { "L3MON4D3/LuaSnip" },
        },
    })
    use {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        requires = { { "nvim-lua/plenary.nvim" } }
    }
    use({
        "stevearc/oil.nvim",
        config = function()
            require("oil").setup()
        end,
    })
    use({
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
            -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
        },
    })
    use({
        "goolord/alpha-nvim",
        requires = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("alpha").setup(require("alpha.themes.startify").config)
        end,
    })
    -- use({
    --     "nvim-neorg/neorg",
    --     lazy = false,
    --     run = ":Neorg sync-parsers",
    --     rocks = { "lua-utils.nvim", "nvim-nio", "nui.nvim", "plenary.nvim" },
    --     tag = "*",
    --     config = function()
    --         vim.keymap.set("n", "<leader>zi", ":Neorg index <CR>", {})
    --         vim.keymap.set("n", "<leader>zr", ":Neorg return <CR>", {})
    --         require("neorg").setup({
    --             load = {
    --                 ["core.defaults"] = {},
    --                 ["core.concealer"] = {},
    --                 ["core.dirman"] = {
    --                     config = {
    --                         workspaces = {
    --                             work = "~/notes/work",
    --                             kast = "~/notes/kast",
    --                             home = "~/notes/home",
    --                         },
    --                         default_workspace = "work",
    --                     },
    --                 },
    --             },
    --         })
    --     end,
    -- })
    use({
        "epwalsh/obsidian.nvim",
        tag = "*",
        requires = {
            "nvim-lua/plenary.nvim",
            -- see below for full list of optional dependencies 👇
        },
    })
    use("nvim-tree/nvim-web-devicons") -- OPTIONAL: for file icons
    use("lewis6991/gitsigns.nvim")     -- OPTIONAL: for git status
    use("romgrk/barbar.nvim")
    use("rescript-lang/vim-rescript")
end)
