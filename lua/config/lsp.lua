local Module = {}

function Module.setup()
	local lspconfig = require("lspconfig")

	-- Diagnostic signs
	local diagnostic_signs = {
		{ name = "DiagnosticSignError", text = "" },
		{ name = "DiagnosticSignWarn",  text = "" },
		{ name = "DiagnosticSignInfo",  text = "" },
		{ name = "DiagnosticSignHint",  text = "󰞂" },
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
	lspconfig['pyright'].setup {
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
    --lspconfig['omnisharp'].setup {
	--	flags = lsp_flags,
	--	capabilities = capabilities,

	--	enable_editorconfig_support = true,

	--	enable_ms_build_load_projects_on_demand = false,

	--	enable_roslyn_analyzers = false,

	--	organize_imports_on_format = true,

	--	enable_import_completion = true,

	--	sdk_include_prereleases = true,

	--	analyze_open_documents_only = false,
	--}
    lspconfig['csharp_ls'].setup {
		flags = lsp_flags,
		capabilities = capabilities,
    }
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
            vim.api.nvim_buf_set_option(ev.buf, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

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
