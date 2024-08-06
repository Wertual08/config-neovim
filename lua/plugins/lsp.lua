return {
    { "williamboman/mason.nvim", lazy = false, opts = {} },
    { "williamboman/mason-lspconfig.nvim", lazy = false, opts = {} },
    { "Hoffs/omnisharp-extended-lsp.nvim", lazy = false },
    { "neovim/nvim-lspconfig", lazy = false },
    { "nvimdev/lspsaga.nvim", event = 'LspAttach', opts = require("config.lspsaga") },
}
