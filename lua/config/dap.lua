local Module = {}

function Module.setup()
    local dap = require("dap")
    local widgets = require('dap.ui.widgets')
    local data_dir = os.getenv("XDG_DATA_HOME") or os.getenv("HOME") .. "/.local/share"
    -- require('dap.ext.autocompl').attach()

    dap.adapters.coreclr = {
        type = "executable",
        command = data_dir .. "/debuggers/netcoredbg/netcoredbg",
        args = { '--interpreter=vscode' },
    }

    dap.adapters.go = {
        type = 'server',
        port = '${port}',
        executable = {
            command = 'dlv',
            args = {'dap', '-l', '127.0.0.1:${port}'},
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
        linehl = "InSearch",
        numhl = "Todo",
    })

    vim.keymap.set('n', '<F5>',         function()
        if dap.session() == nil then
            require('dap.ext.vscode').load_launchjs(
                nil,
                { coreclr = { "cs" },
            })
        end

        dap.continue()
    end)
    vim.keymap.set('n', '<S-F5>',       dap.terminate)
    vim.keymap.set('n', '<F10>',        dap.step_over)
    vim.keymap.set('n', '<F11>',        dap.step_into)
    vim.keymap.set('n', '<F12>',        dap.step_out)
    vim.keymap.set('n', '<Leader>b',    dap.toggle_breakpoint)

    local scopes = widgets.sidebar(widgets.scopes, { width = 80 })

    vim.keymap.set('n', '<Leader>o', function()
        dap.repl.toggle()
    end)
    vim.keymap.set('n', '<Leader>v', scopes.toggle)
    vim.keymap.set({'n', 'v'}, '<Leader>k', widgets.hover)

    vim.keymap.set('n', '<Leader>f', function()
      	widgets.centered_float(widgets.frames)
    end)
    vim.keymap.set('n', '<Leader>n', function()
      	widgets.centered_float(widgets.sessions)
    end)
    vim.keymap.set('n', '<Leader>e', function()
      	widgets.centered_float(widgets.expression)
    end)
    vim.keymap.set('n', '<Leader>t', function()
      	widgets.centered_float(widgets.threads)
    end)
end

return Module
