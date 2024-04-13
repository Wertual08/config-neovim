local Module = {}

function Module.setup()
    local lspconfig = require("lspconfig")

    -- Diagnostic signs
    local diagnostic_signs = {
        { name = "DiagnosticSignError", text = "" },
        { name = "DiagnosticSignWarn", text = "" },
        { name = "DiagnosticSignInfo", text = "" },
        { name = "DiagnosticSignHint", text = "󰞂" },
    }
    for _, sign in ipairs(diagnostic_signs) do
        vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = sign.name })
    end


    local lsp_flags = {
        debounce_text_changes = 150,
    }
    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    lspconfig['gopls'].setup {
        flags = lsp_flags,
        capabilities = capabilities,
        settings = {
            gopls = {
                analyses = {
                    nilness = true,
                    unusedparams = true,
                    unusedwrite = true,
                    useany = true,
                    unusedvariable = true,
                },
                staticcheck = true,
            },
        },
    }
    lspconfig['html'].setup {
        flags = lsp_flags,
        capabilities = capabilities,
    }
    lspconfig['jsonls'].setup {
        flags = lsp_flags,
        capabilities = capabilities,
    }
    lspconfig['pylsp'].setup {
        flags = lsp_flags,
        capabilities = capabilities,
    }
    lspconfig['lua_ls'].setup {
        flags = lsp_flags,
        capabilities = capabilities,
        settings = {
            Lua = {
                runtime = {
                    version = "LuaJIT",
                    path = vim.split(package.path, ";"),
                },
                diagnostics = {
                    globals = { "vim" },
                },
                workspace = {
                    library = {
                        [vim.fn.expand "$VIMRUNTIME/lua"] = true,
                        [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
                    },
                },
            },
        },
    }
    lspconfig['vimls'].setup {
        flags = lsp_flags,
        capabilities = capabilities,
    }
    lspconfig['tsserver'].setup {
        flags = lsp_flags,
        capabilities = capabilities,
    }
    lspconfig['omnisharp'].setup {
        flags = lsp_flags,
        capabilities = capabilities,

        handlers = {
            ["textDocument/definition"] = require('omnisharp_extended').definition_handler,
            ["textDocument/typeDefinition"] = require('omnisharp_extended').type_definition_handler,
            ["textDocument/references"] = require('omnisharp_extended').references_handler,
            ["textDocument/implementation"] = require('omnisharp_extended').implementation_handler,
        },

        settings = {
            FormattingOptions = {
                EnableEditorConfigSupport = false,
                OrganizeImports = true,
                --NewLine = "\n",
                UseTabs = false,
                TabSize = 4,
                IndentationSize = 4,
                SpacingAfterMethodDeclarationName = false,
                SpaceWithinMethodDeclarationParenthesis = false,
                SpaceBetweenEmptyMethodDeclarationParentheses = false,
                SpaceAfterMethodCallName = false,
                SpaceWithinMethodCallParentheses = false,
                SpaceBetweenEmptyMethodCallParentheses = false,
                SpaceAfterControlFlowStatementKeyword = true,
                SpaceWithinExpressionParentheses = false,
                SpaceWithinCastParentheses = false,
                SpaceWithinOtherParentheses = false,
                SpaceAfterCast = false,
                SpacesIgnoreAroundVariableDeclaration = false,
                SpaceBeforeOpenSquareBracket = false,
                SpaceBetweenEmptySquareBrackets = false,
                SpaceWithinSquareBrackets = false,
                SpaceAfterColonInBaseTypeDeclaration = true,
                SpaceAfterComma = true,
                SpaceAfterDot = false,
                SpaceAfterSemicolonsInForStatement = true,
                SpaceBeforeColonInBaseTypeDeclaration = true,
                SpaceBeforeComma = false,
                SpaceBeforeDot = false,
                SpaceBeforeSemicolonsInForStatement = false,
                SpacingAroundBinaryOperator = "single",
                IndentBraces = false,
                IndentBlock = true,
                IndentSwitchSection = true,
                IndentSwitchCaseSection = true,
                IndentSwitchCaseSectionWhenBlock = true,
                LabelPositioning = "oneLess",
                WrappingPreserveSingleLine = true,
                WrappingKeepStatementsOnSingleLine = true,
                NewLinesForBracesInTypes = false,
                NewLinesForBracesInMethods = false,
                NewLinesForBracesInProperties = false,
                NewLinesForBracesInAccessors = false,
                NewLinesForBracesInAnonymousMethods = false,
                NewLinesForBracesInControlBlocks = false,
                NewLinesForBracesInAnonymousTypes = false,
                NewLinesForBracesInObjectCollectionArrayInitializers = false,
                NewLinesForBracesInLambdaExpressionBody = false,
                NewLineForElse = true,
                NewLineForCatch = true,
                NewLineForFinally = true,
                NewLineForMembersInObjectInit = true,
                NewLineForMembersInAnonymousTypes = true,
                NewLineForClausesInQuery = true
            },

            RoslynExtensionsOptions = {
                documentAnalysisTimeoutMs = 30000,
                enableDecompilationSupport = true,
                enableImportCompletion = true,
                --enableAnalyzersSupport = true,
                locationPaths = {
                },
                inlayHintsOptions = {
                    enableForParameters = true,
                    forLiteralParameters = true,
                    forIndexerParameters = true,
                    forObjectCreationParameters = true,
                    forOtherParameters = true,
                    suppressForParametersThatDifferOnlyBySuffix = false,
                    suppressForParametersThatMatchMethodIntent = false,
                    suppressForParametersThatMatchArgumentName = false,
                    enableForTypes = true,
                    forImplicitVariableTypes = true,
                    forLambdaParameterTypes = true,
                    forImplicitObjectCreation = true
                },
            },
        },
    }
    --lspconfig['csharp_ls'].setup {
    --	flags = lsp_flags,
    --	capabilities = capabilities,
    --}
    lspconfig['rust_analyzer'].setup {
        flags = lsp_flags,
        capabilities = capabilities,

        settings = {
            ["rust-analyzer"] = {
                imports = {
                    granularity = {
                        group = "item",
                    },
                    group = {
                        enable = false,
                    },
                    prefix = "self",
                },
            }
        }
    }
    lspconfig['zls'].setup {
        flags = lsp_flags,
        capabilities = capabilities,
    }
    lspconfig['kotlin_language_server'].setup {
        flags = lsp_flags,
        capabilities = capabilities,
    }

    local opts = { noremap = true, silent = true }
    vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
    vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

    vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
            vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

            local bufopts = { noremap = true, silent = true, buffer = ev.buf }
            vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
            vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
            vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
            vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
            vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
            vim.keymap.set('n', '<space>wl', function()
                print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
            end, bufopts)
            vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
            vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
            vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
            vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
            vim.keymap.set('n', '<space><C-f>', function() vim.lsp.buf.format { async = true } end, bufopts)
        end,
    })
end

return Module
