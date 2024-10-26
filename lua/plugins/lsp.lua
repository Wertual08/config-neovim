return {
    { "williamboman/mason.nvim", lazy = false },
    { "williamboman/mason-lspconfig.nvim", lazy = false },
    { "neovim/nvim-lspconfig", lazy = false },

    { "Hoffs/omnisharp-extended-lsp.nvim", lazy = false },
    { "nvimdev/lspsaga.nvim", event = 'LspAttach', opts = require("config.lspsaga") },
}
