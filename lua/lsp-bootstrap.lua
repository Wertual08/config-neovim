local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local lspconfig = require("lspconfig")
local cmp_nvim_lsp = require('cmp_nvim_lsp')

mason.setup()
mason_lspconfig.setup()

lspconfig.util.default_config = vim.tbl_extend(
    "force",
    lspconfig.util.default_config,
    {
        flags = {
            debounce_text_changes = 150,
        },
        capabilities = cmp_nvim_lsp.default_capabilities(),
    }
)

mason_lspconfig.setup_handlers {
    function (server_name)
        require("lspconfig")[server_name].setup {}
    end,

    ["rust_analyzer"] = function ()
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
    end,

    ["gopls"] = function ()
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
    end,

    ["lua_ls"] = function ()
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
    end,

    ["omnisharp"] = function ()
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
                        suppressForParametersThatMatchArgumentName = false, enableForTypes = true,
                        forImplicitVariableTypes = true,
                        forLambdaParameterTypes = true,
                        forImplicitObjectCreation = true
                    },
                },
            },
        }
    end,
}
