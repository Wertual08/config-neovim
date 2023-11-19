local Module = {}

function Module.setup()
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
    vim.opt.termguicolors = true

    local api = require("nvim-tree.api")
    vim.keymap.set('n', '<space>v', api.tree.toggle, {})

    local nvimtree = require("nvim-tree")
    nvimtree.setup {
        disable_netrw = true,
        hijack_netrw = true,
        view = {
            width = 80,
            --side = "right",
            number = true,
            relativenumber = true,
            --preserve_window_proportions = true,
            float = {
                enable = true,
                open_win_config = function ()
                    return {
                        relative = "editor",
                        border = "rounded",
                        anchor = "NE",
                        row = 1,
                        col = vim.api.nvim_get_option("columns") - 1,
                        width = 80,
                        height = vim.api.nvim_get_option("lines") - 5,
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
end

return Module
