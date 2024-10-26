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


local lspconfig = require("lspconfig")

lspconfig.util.default_config = vim.tbl_extend(
    "force",
    lspconfig.util.default_config,
    {
        flags = {
            debounce_text_changes = 150,
        },
        capabilities = require('cmp_nvim_lsp').default_capabilities(),
    }
)

lspconfig.gopls.setup {
    settings = {
        gopls = {
            semanticTokens = true,
            codelenses = {
                gc_details = true,
                generate = true,
                regenerate_cgo = true,
                run_govulncheck = true,
                tidy = true,
                upgrade_dependency = true,
                vendor = true,
            },
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

lspconfig.html.setup {
}

lspconfig.jsonls.setup {
}

lspconfig.pylsp.setup {
}

lspconfig.lua_ls.setup {
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

lspconfig.vimls.setup {
}

lspconfig.ts_ls.setup {
}

lspconfig.omnisharp.setup {
    handlers = {
        ["textDocument/definition"] = require('omnisharp_extended').definition_handler,
        ["textDocument/typeDefinition"] = require('omnisharp_extended').type_definition_handler,
        ["textDocument/references"] = require('omnisharp_extended').references_handler,
        ["textDocument/implementation"] = require('omnisharp_extended').implementation_handler,
    },

    settings = {
        omnisharp = {
            enableLspDriver = true,
        },

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
            NewLineForClausesInQuery = true,
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

lspconfig.rust_analyzer.setup {
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

lspconfig.zls.setup {
}

lspconfig.kotlin_language_server.setup {
}
