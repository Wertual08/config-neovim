local Module = {}

function Module.setup()
  require("bufferline").setup {
    options = {
      numbers = "none",
      diagnostics = "nvim_lsp",
      separator_style = { "|", "|" },
      show_tab_indicators = true,
      show_buffer_close_icons = false,
      show_close_icon = false,
    },
  }
end

return Module
