require("packer-config").setup()
require("setup").setup()

vim.opt.tabstop         = 4
vim.opt.softtabstop     = 0
vim.opt.shiftwidth      = 4
vim.opt.expandtab       = true
vim.opt.smarttab        = true
vim.opt.rnu             = true
vim.opt.nu              = true
vim.opt.splitright      = true
vim.opt.autoread        = true
vim.opt.scrolloff       = 10
vim.opt.completeopt     = 'noinsert' -- ????
vim.cmd([[tnoremap <Esc> <C-\><C-n>]])

vim.cmd([[aunmenu PopUp.How-to\ disable\ mouse]])
vim.cmd([[aunmenu PopUp.-1-]])

vim.keymap.set('n', '<space>t', '<Cmd>ToggleTerm<CR>', {silent = true })
vim.keymap.set('n', ',', '<Cmd>BufferLineCyclePrev<CR>', {silent = true })
vim.keymap.set('n', '.', '<Cmd>BufferLineCycleNext<CR>', {silent = true })
vim.keymap.set('n', '<C-,>', '<Cmd>BufferLineMovePrev<CR>', {silent = true })
vim.keymap.set('n', '<C-.>', '<Cmd>BufferLineMoveNext<CR>', {silent = true })
vim.keymap.set('n', '<space>s', function () require('rest-nvim').run() end)


