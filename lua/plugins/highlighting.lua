return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function ()
        require('nvim-treesitter.configs').setup(require("config.nvim-treesitter"))
    end,
}
