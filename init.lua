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

vim.keymap.set('n', '[d',           '<Cmd>Lspsaga diagnostic_jump_prev<CR>', { noremap = true, silent = true })
vim.keymap.set('n', ']d',           '<Cmd>Lspsaga diagnostic_jump_next<CR>', { noremap = true, silent = true })
vim.keymap.set('n', 'gd',           '<Cmd>Lspsaga goto_definition<CR>', { noremap = true, silent = true })
vim.keymap.set('n', 'K',            '<Cmd>Lspsaga hover_doc<CR>', { noremap = true, silent = true })
vim.keymap.set('n', 'gi',           '<Cmd>Lspsaga finder imp<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<space>D',     '<Cmd>Lspsaga goto_type_definition<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<space>rn',    '<Cmd>Lspsaga rename<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<space>ca',    '<Cmd>Lspsaga code_action<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<space>o',     '<Cmd>Lspsaga outline<CR>', { noremap = true, silent = true })
vim.keymap.set('n', 'gr',           '<Cmd>Lspsaga finder ref+def+imp<CR>', { noremap = true, silent = true })
vim.keymap.set('n', 'gD',           vim.lsp.buf.declaration, { noremap = true, silent = true })
vim.keymap.set('n', '<C-k>',        vim.lsp.buf.signature_help, { noremap = true, silent = true })
vim.keymap.set('n', '<space>wa',    vim.lsp.buf.add_workspace_folder, { noremap = true, silent = true })
vim.keymap.set('n', '<space>wr',    vim.lsp.buf.remove_workspace_folder, { noremap = true, silent = true })
vim.keymap.set('n', '<space>wl',    function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, { noremap = true, silent = true })
vim.keymap.set('n', '<space><C-f>', function() vim.lsp.buf.format { async = true } end, { noremap = true, silent = true })
