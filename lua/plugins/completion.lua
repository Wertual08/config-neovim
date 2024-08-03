return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-calc",
        "hrsh7th/cmp-emoji",
        "hrsh7th/cmp-vsnip",
        "hrsh7th/vim-vsnip"
    },

    config = function ()
        require("config.nvim-cmp")
    end,
}
