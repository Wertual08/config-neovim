local Module = {}

function Module.setup()
  require("nvim-treesitter.configs").setup {
    ensure_installed = "all",

    sync_install = false,

    highlight = {
      enable = true,
    },
  }
end

return Module
