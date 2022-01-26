local use = require("packer").use
local user_settings_file = require("../user_settings")

return require("packer").startup(function()
    -- Packer can manage itself
    use "wbthomason/packer.nvim"

    -- Color schemes.
    use { "folke/tokyonight.nvim" }
    use { "bluz71/vim-nightfly-guicolors" }
    use { "bluz71/vim-moonfly-colors" }
    use { "shaunsingh/nord.nvim" }
    use { "navarasu/onedark.nvim" }
    use { "wuelnerdotexe/vim-enfocado" }
    use { "sainnhe/everforest" }
    use { "sainnhe/sonokai" }
    use { "pineapplegiant/spaceduck" }
    use { "sonph/onehalf" }
    use { "rakr/vim-one" }
    use { "fenetikm/falcon" }
    use { "Rigellute/rigel" }
    use { "hzchirs/vim-material" }
    use {"kyazdani42/nvim-web-devicons"}

    use { "tpope/vim-sleuth" }


    -- This plugin show trailing whitespace.
    use {
        "ntpeters/vim-better-whitespace",
        cmd = {
            "EnableWhitespace",
            "DisableWhitespace",
            "StripWhitespace",
            "EnableStripWhitespaceOnSave"
        },
        setup = function()
            require("plugins/better-whitespace")
        end
    }

    -- Icons.

    -- File explorer tree.
    use {
        "kyazdani42/nvim-tree.lua",
        config = function()
            require("plugins/nvim-tree")
        end
    }

    -- Bufferline on the top.
    use {
        "romgrk/barbar.nvim",
        requires = {"kyazdani42/nvim-web-devicons"},
        config = function()
            require("plugins/barbar")
        end
    }

    -- Statusline at the bottom.
    use {
        "nvim-lualine/lualine.nvim",
        config = function ()
            require("plugins/lualine")
        end
    }


    -- TreeSitter.
    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        event = "BufEnter",
        cmd = {
            "TSInstall",
            "TSInstallSync",
            "TSBufEnable",
            "TSBufToggle",
            "TSEnableAll",
            "TSInstallFromGrammer",
            "TSToggleAll",
            "TSUpdate",
            "TSUpdateSync"
        },
        config = function()
            require("plugins/treesitter")
        end
    }

    -- Fuzzy finder and it requirments.
    -- TODO: lazy load plenary, popup and telescope-media-files
    use { "nvim-lua/plenary.nvim" }

    use {
        "nvim-telescope/telescope-fzf-native.nvim", run = "make",
        cmd = "Telescope"
    }

    local os = vim.loop.os_uname().sysname
    if (os == "Linux" or os == "Darwin") and vim.fn.has("wsl") == 0 then
        use {
            "nvim-lua/popup.nvim",
            after = "telescope-fzf-native.nvim"
        }
        use {
            "nvim-telescope/telescope-media-files.nvim",
            after = "popup.nvim"
        }
        use {
            "artart222/telescope_find_directories",
            after = "telescope-media-files.nvim"
        }
    else
        -- TODO: Find a way to lazyload this on windows.
        use {
            "artart222/telescope_find_directories",
            after = "telescope-fzf-native.nvim"
        }
    end
    use {
        "nvim-telescope/telescope.nvim",
        after = "telescope_find_directories",
        config = function()
            require("plugins/telescope")
        end
    }

    -- LSP, LSP installer and tab completion.
    use {
        "neovim/nvim-lspconfig",
        "williamboman/nvim-lsp-installer",
        after = "nvim-lspconfig",
        config = function()
            require("../lsp")
        end
    }

    use {
        "hrsh7th/cmp-nvim-lsp",
        after = "nvim-lsp-installer"
    }

    -- LSP signature.
    use {
        "ray-x/lsp_signature.nvim",
        after = "nvim-lspconfig",
        config = function ()
            require("lsp_signature").setup()
        end
    }

    -- VsCode like pictograms for lsp.
    use {
        "onsails/lspkind-nvim",
        after = "friendly-snippets"
    }

    use {
        "rafamadriz/friendly-snippets",
        event = "InsertEnter"
    }
    use {
        "hrsh7th/nvim-cmp",
        after = "friendly-snippets",
        config = function()
            require("plugins/cmp")
        end
    }
    use {
        "L3MON4D3/LuaSnip",
        after = "nvim-cmp"
    }
    use {
        "saadparwaiz1/cmp_luasnip",
        after = "LuaSnip"
    }
    use {
        "hrsh7th/cmp-buffer",
        after = "cmp_luasnip"
    }
    use {
        "hrsh7th/cmp-path",
        after = "cmp-buffer"
    }

    -- Terminal.
    use {
        "akinsho/nvim-toggleterm.lua",
        cmd = "ToggleTerm",
        config = function()
            require("plugins/toggleterm")
        end
    }

    -- Git support for nvim.
    use {
        "tpope/vim-fugitive",
        cmd = "Git"
    }

    -- Git signs.
    use {
        "lewis6991/gitsigns.nvim",
        event = "BufRead",
        requires = {
            "nvim-lua/plenary.nvim"
        },
        config = function()
            require("plugins/gitsigns")
        end
    }

    -- Auto closes.
    use {
        "windwp/nvim-autopairs",
        event = "BufRead",
        config = function()
            require("nvim-autopairs").setup{}
        end
    }

    -- todo-comments is a lua plugin for Neovim to highlight and search for
    -- todo comments like TODO, HACK, BUG in code base.
    use {
        "folke/todo-comments.nvim",
        event = "BufEnter",
        config = function()
            require("plugins/todo-comments")
        end
    }


    -- Neovim plugin to comment text in and out.
    -- Supports commenting out the current line, a visual selection and a motion.
    use {
        "terrortylor/nvim-comment",
        cmd = "CommentToggle",
        config = function()
            require("nvim_comment").setup()
        end
    }

    -- Tagbar
    use {
        "preservim/tagbar",
        config = function()
            require("plugins/tagbar")
        end
    }
end)

