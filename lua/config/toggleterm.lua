local Module = {}

function Module.setup()
    require("toggleterm").setup {
        direction = "float",
        start_in_insert = false,
    }
end

return Module
