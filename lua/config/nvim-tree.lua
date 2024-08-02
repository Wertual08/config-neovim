return {
    disable_netrw = true,
    hijack_netrw = true,
    view = {
        width = 80,
        number = true,
        relativenumber = true,
        float = {
            enable = true,
            open_win_config = function()
                return {
                    relative = "editor",
                    border = "single",
                    anchor = "NE",
                    row = 1,
                    col = vim.api.nvim_get_option_value("columns", {}) - 1,
                    width = 80,
                    height = vim.api.nvim_get_option_value("lines", {}) - 5,
                }
            end,
        },
    },
    filters = {
        custom = { "^\\.git$" },
        dotfiles = false,
    },
    actions = {
        open_file = {
            quit_on_open = true,
            resize_window = true,
        },
    },
    git = {
        ignore = false,
    },
}
