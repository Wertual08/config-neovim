return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = "nvim-lua/plenary.nvim",
        opts = require("config.telescope"),
    },
    {  'brooth/far.vim' },
}
