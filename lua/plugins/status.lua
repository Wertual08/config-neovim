return {
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        opts = require("config.lualine"),
    },
    {
        'linrongbin16/lsp-progress.nvim',
        config = function()
            require('lsp-progress').setup()
        end,
    },
    {
        "akinsho/bufferline.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        opts = require("config.bufferline"),
    },
}
