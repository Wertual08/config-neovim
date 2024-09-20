local dap = require("dap")
local widgets = require('dap.ui.widgets')

dap.adapters.coreclr = {
    type = "executable",
    command = "netcoredbg",
    args = { '--interpreter=vscode' },
}

dap.adapters.go = {
    type = 'server',
    port = '${port}',
    executable = {
        command = 'dlv',
        args = { 'dap', '-l', '127.0.0.1:${port}' },
    },
}

dap.configurations.go = {
    {
        type = "go",
        name = "Debug",
        request = "launch",
        program = "${file}"
    },
    {
        type = "go",
        name = "Debug test", -- configuration for debugging test files
        request = "launch",
        mode = "test",
        program = "${file}"
    },
    -- works with go.mod packages and sub packages
    {
        type = "go",
        name = "Debug test (go.mod)",
        request = "launch",
        mode = "test",
        program = "./${relativeFileDirname}"
    }
}


vim.fn.sign_define('DapBreakpoint', {
    text = "󰧚",
    texthl = "ErrorMsg",
    linehl = "Search",
    numhl = "ErrorMsg",
})
vim.fn.sign_define('DapStopped', {
    text = "󰘤",
    texthl = "Todo",
    linehl = "CurSearch",
    numhl = "Todo",
})

vim.keymap.set('n', '<F5>', function()
    dap.continue()
end)
vim.keymap.set('n', '<F4>', dap.terminate)
vim.keymap.set('n', '<F10>', dap.step_over)
vim.keymap.set('n', '<F11>', dap.step_into)
vim.keymap.set('n', '<F12>', dap.step_out)
vim.keymap.set('n', '\\b', dap.toggle_breakpoint)

local scopes = widgets.sidebar(widgets.scopes, { width = 80 })

vim.keymap.set('n', '\\o', function()
    dap.repl.toggle()
end)
vim.keymap.set('n', '\\v', scopes.toggle)
vim.keymap.set({ 'n', 'v' }, '\\k', widgets.hover)

vim.keymap.set('n', '\\f', function()
    widgets.centered_float(widgets.frames)
end)
vim.keymap.set('n', '\\n', function()
    widgets.centered_float(widgets.sessions)
end)
vim.keymap.set('n', '\\e', function()
    widgets.centered_float(widgets.expression)
end)
vim.keymap.set('n', '\\t', function()
    widgets.centered_float(widgets.threads)
end)
