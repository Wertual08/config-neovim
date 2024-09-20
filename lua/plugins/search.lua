return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = "nvim-lua/plenary.nvim",
        opts = require("config.telescope"),
    },
    { "MagicDuck/grug-far.nvim", opts = require("config.grug-far") },
}
