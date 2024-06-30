local Module = {}

function Module.setup(use)
    -- Colorscheme
    use {
        "Mofiqul/vscode.nvim",
        config = function()
            local vscode = require('vscode')

            vscode.load()

            vim.cmd("colorscheme vscode")
        end,
    }

    -- Icons
    use { "nvim-tree/nvim-web-devicons" }

    -- LSP
    use { "williamboman/mason.nvim" }
    use { "williamboman/mason-lspconfig.nvim" }
    use { "neovim/nvim-lspconfig" }
    use { "Hoffs/omnisharp-extended-lsp.nvim" }

    -- Debugger
    use { "mfussenegger/nvim-dap" }

    -- Completion
    use {
        "hrsh7th/nvim-cmp",
        requires = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-nvim-lua",
            "hrsh7th/cmp-cmdline",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-calc",
            "hrsh7th/cmp-emoji",
            "hrsh7th/cmp-vsnip",
            "hrsh7th/vim-vsnip",
        },
    }

    -- Analyzer
    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
    }

    -- Statusbar
    use {
        "nvim-lualine/lualine.nvim",
        event = "VimEnter",
        config = require("config.lualine").setup,
    }

    -- Topbar
    use {
        "akinsho/nvim-bufferline.lua",
        event = "BufReadPre",
        config = require("config.bufferline").setup,
    }

    -- File search
    use {
        "nvim-telescope/telescope.nvim",
        requires = "nvim-lua/plenary.nvim",
    }

    use { "nvim-tree/nvim-tree.lua" }

    -- Terminal
    use {
        "akinsho/toggleterm.nvim",
        tag = '*',
    }
end

return Module
