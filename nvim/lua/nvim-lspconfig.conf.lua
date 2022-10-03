
-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer

-- setup nvim-cmp
local cmp = require('cmp')

cmp.setup({
    snippet = {
        expand = function(args)
        -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        -- require'snippy'.expand_snippet(args.body) -- For `snippy` users.
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        -- { name = 'vsnip' }, -- For vsnip users.
        -- { name = 'luasnip' }, -- For luasnip users.
        -- { name = 'ultisnips' }, -- For ultisnips users.
        -- { name = 'snippy' }, -- For snippy users.
    })
})



local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
local buf_map = function(bufnr, mode, lhs, rhs, opts)
    vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts or {
        silent = true,
    })
end
lspconfig = require('lspconfig')

local on_attach = function(client, bufnr)
        -- Mappings.
        -- See `:help vim.diagnostic.*` for documentation on any of the below functions
        local opts = { noremap=true, silent=true }
        vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
        vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
        vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
        -- Enable completion triggered by <c-x><c-o>
        -- vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

        -- Mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-s>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'i', '<C-s>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.format { async = true }<CR>', opts)

        -- Set autocommands conditional on server_capabilities
        if client.server_capabilities.documentHighlightProvider then
            local group = vim.api.nvim_create_augroup("LSPDocumentHighlight", {})
            vim.api.nvim_create_autocmd({ "CursorHold" }, {
                buffer=bufnr,
                group=group,
                callback = function()
                    vim.lsp.buf.document_highlight()
                end,
            })
            vim.api.nvim_create_autocmd({ "CursorMoved" }, {
                buffer=bufnr,
                group=group,
                callback = function()
                    vim.lsp.buf.clear_references()
                end,
            })
        end
        if client.server_capabilities.signatureHelpProvider then
            vim.api.nvim_create_autocmd({ "CursorHoldI" }, {
                buffer=bufnr,
                callback = function()
                    vim.lsp.buf.signature_help()
                end,
            })
        end
        vim.api.nvim_create_autocmd({ "CursorHold" }, {
            buffer=bufnr,
            callback = function()
                vim.diagnostic.open_float(0, {focusable=false})
            end,
        })
        vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
        vim.lsp.diagnostic.on_publish_diagnostics, {
            virtual_text = {
                prefix = ""
            },
            severity_sort = true,
            underline = true,
            signs = true,
        }
        )

    end

lspconfig.pyright.setup{
    on_attach = function(client, bufnr)
        on_attach(client, bufnr)
        buf_map(bufnr, "n", "<space>f", ":Black<CR>")
    end,
    capabilities = capabilities,
    -- settings = {
    --     python = {
    --         analysis = {
    --             -- stubPath = "/home/gshpychka/venvs/.typestubs",
    --             useLibraryCodeForTypes = false,
    --             diagnosticMode = "openFilesOnly",
    --             -- autoSearchPaths = false,
    --             typeCheckingMode = "basic",
    --             reportMissingTypeStubs = false,
    --             diagnosticSeverityOverrides = {
    --                 reportUninitializedInstanceVariable = "warning",
    --                 reportMissingImports = "error",
    --                 reportImportCycles = "warning",
    --                 reportDuplicateImport = "info",
    --                 reportOverlappingOverload = "warning",
    --                 reportIncompatibleMethodOverride = "warning",
    --                 reportIncompatibleVariableOverride = "warning",
    --                 strictParameterNoneValue = "info",
    --                 strictListInference = true,
    --                 strictDictionaryInference = true,
    --                 strictSetInference = true,
    --                 reportUnnecessaryCast = "info",
    --                 reportUnnecessaryComparison = "info",
    --                 reportUnnecessaryIsInstance = "info",
    --                 reportUnnecessaryTypeIgnoreComment = "info",
    --                 reportImplicitStringConcatenation = "warning",
    --                 reportCallInDefaultInitializer = "error",
    --                 reportPropertyTypeMismatch = "warning",
    --                 reportUntypedFunctionDecorator = "info",
    --                 reportUntypedClassDecorator = "info",
    --                 reportUntypedBaseClass = "info",
    --                 reportPrivateUsage = "warning",
    --                 reportConstantRedefinition = "warning",
    --                 reportMissingSuperCall = "warning",
    --                 reportUnknownParameterType = "none",
    --                 reportUnknownArgumentType = "none",
    --                 reportUnknownVariableType = "none",
    --                 reportUnknownMemberType = "none",
    --                 reportMissingParameterType = "none",
    --                 reportMissingTypeArgument = "none",
    --                 reportUnusedVariable = "info",
    --             }
    --         }
    --     }
    -- }
}

lspconfig.tsserver.setup({
   on_attach = function(client, bufnr)
        client.resolved_capabilities.document_formatting = false
        client.resolved_capabilities.document_range_formatting = false

        local ts_utils = require("nvim-lsp-ts-utils")
        ts_utils.setup({})
        ts_utils.setup_client(client)

        buf_map(bufnr, "n", "gs", ":TSLspOrganize<CR>")
        buf_map(bufnr, "n", "gi", ":TSLspRenameFile<CR>")
        buf_map(bufnr, "n", "go", ":TSLspImportAll<CR>")

        on_attach(client, bufnr)
    end,
})

local null_ls = require('null-ls')

null_ls.setup({
    sources = {
        null_ls.builtins.diagnostics.eslint,
        null_ls.builtins.code_actions.eslint,
        null_ls.builtins.formatting.prettier
    },
    on_attach = on_attach
})

-- require'lspconfig'.rust_analyzer.setup{}
