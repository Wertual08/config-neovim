local Module = {}

function Module.setup()
    require("nvim-web-devicons").setup { default = true }
    require("config.nvim-tree").setup()
    require("config.cmp").setup()
    require("config.mason").setup()
    require("config.mason-lspconfig").setup()
    require("config.lsp").setup()
    require("config.dap").setup()
    require("config.treesitter").setup()
    require("config.telescope").setup()
    require("config.toggleterm").setup()
end

return Module
