local Module = {}

function Module.setup()
    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<Space>f', builtin.find_files, {})
    vim.keymap.set('n', '<Space>g', function ()
        builtin.live_grep({ default_text = vim.fn.expand('<cword>') })
    end, {})
    vim.keymap.set('n', '<Space>b', builtin.buffers, {})
    vim.keymap.set('n', '<Space>h', builtin.help_tags, {})

    require("telescope").setup {
        defaults = {
            file_ignore_patterns = { "bin", "obj" }
        }
    }
end

return Module
