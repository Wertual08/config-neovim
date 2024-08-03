require("lazy-bootstrap")
require("lsp-bootstrap")

vim.opt.tabstop     = 4
vim.opt.softtabstop = 0
vim.opt.shiftwidth  = 4
vim.opt.expandtab   = true
vim.opt.smarttab    = true
vim.opt.rnu         = true
vim.opt.nu          = true
vim.opt.splitright  = true
vim.opt.autoread    = true
vim.opt.lazyredraw  = true
vim.opt.scrolloff   = 10

vim.cmd([[tnoremap <Esc> <C-\><C-n>]])

vim.cmd([[aunmenu PopUp.How-to\ disable\ mouse]])
vim.cmd([[aunmenu PopUp.-1-]])

vim.keymap.set('n', '<space>t', '<Cmd>ToggleTerm<CR>', { silent = true })
vim.keymap.set('n', ',', '<Cmd>BufferLineCyclePrev<CR>', { silent = true })
vim.keymap.set('n', '.', '<Cmd>BufferLineCycleNext<CR>', { silent = true })
vim.keymap.set('n', '<C-,>', '<Cmd>BufferLineMovePrev<CR>', { silent = true })
vim.keymap.set('n', '<C-.>', '<Cmd>BufferLineMoveNext<CR>', { silent = true })

vim.keymap.set('n', '<Space>f', require('telescope.builtin').find_files, {})
vim.keymap.set('n', '<Space>g', function()
    require('telescope.builtin').live_grep({ default_text = vim.fn.expand('<cword>') })
end, {})
vim.keymap.set('n', '<Space>b', require('telescope.builtin').buffers, {})
vim.keymap.set('n', '<Space>h', require('telescope.builtin').help_tags, {})

vim.keymap.set('n', '<space>v', require("nvim-tree.api").tree.toggle, {})

vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, { noremap = true, silent = true })
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { noremap = true, silent = true })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { noremap = true, silent = true })
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, { noremap = true, silent = true })

vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { noremap = true, silent = true })
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { noremap = true, silent = true })
vim.keymap.set('n', 'K', vim.lsp.buf.hover, { noremap = true, silent = true })
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { noremap = true, silent = true })
vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, { noremap = true, silent = true })
vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, { noremap = true, silent = true })
vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, { noremap = true, silent = true })
vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end, { noremap = true, silent = true })
vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, { noremap = true, silent = true })
vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, { noremap = true, silent = true })
vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, { noremap = true, silent = true })
vim.keymap.set('n', 'gr', vim.lsp.buf.references, { noremap = true, silent = true })
vim.keymap.set('n', '<space><C-f>', function() vim.lsp.buf.format { async = true } end, { noremap = true, silent = true })
