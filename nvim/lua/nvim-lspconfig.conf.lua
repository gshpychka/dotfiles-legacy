local nvim_lsp = require('lspconfig')
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  require('lspkind').init({
    with_text = true,
    symbol_map = {
      Text = '',
      Method = 'ƒ',
      Function = '',
      Constructor = '',
      Variable = '',
      Class = '',
      Interface = 'ﰮ',
      Module = '',
      Property = '',
      Unit = '',
      Value = '',
      Enum = '了',
      Keyword = '',
      Snippet = '﬌',
      Color = '',
      File = '',
      Folder = '',
      EnumMember = '',
      Constant = '',
      Struct = ''
    },
  })

  -- Mappings.
  local opts = { noremap=true, silent=true }
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  -- buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('i', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

  -- Set some keybinds conditional on server capabilities
  if client.resolved_capabilities.document_formatting then
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  elseif client.resolved_capabilities.document_range_formatting then
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
  end

  -- Set autocommands conditional on server_capabilities
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec([[
      hi LspReferenceRead ctermbg=LightGray ctermfg=none guibg='#7c6f64' guifg=none
      hi LspReferenceText ctermbg=LightGray ctermfg=none guibg='#7c6f64' guifg=none
      hi LspReferenceWrite ctermbg=LightGray ctermfg=none guibg='#7c6f64' guifg=none
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]], false)
  end
  -- vim.cmd [[autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()]]
  -- vim.cmd [[autocmd CursorHoldI * silent! lua require('lspsaga.signaturehelp').signature_help()]]
  vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
      virtual_text = true,
      underline = true,
      signs = true,
  }
  )

end

nvim_lsp["pyright"].setup{
    on_attach = on_attach,
    settings = {
        python = {
            analysis = {
                stubPath = "/home/gshpychka/venvs/.typestubs",
                useLibraryCodeForTypes = true,
                typeCheckingMode = "basic",
                diagnosticSeverityOverrides = {
                    reportMissingTypeStubs = "info",
                    reportMissingImports = "error",
                    reportImportCycles = "warning",
                    reportDuplicateImport = "info",
                    reportOverlappingOverload = "warning",
                    reportIncompatibleMethodOverride = "warning",
                    reportIncompatibleVariableOverride = "warning"
                }
            }
        }
    }
}

-- nvim_lsp["jedi_language_server"].setup{
--     on_attach=on_attach,
--     settings = {
--         autoImportModules = {"pandas", "numpy", "bokeh"}
--     }
-- }

-- nvim_lsp["pyls"].setup{
--     on_attach = on_attach,
--     settings = {
--         pyls = {
--             plugins = {
--                 jedi_hover = {
--                     enabled = true
--                 },
--                 jedi_completion = {
--                     enabled = true
--                 },
--                 jedi_definition = {
--                     enabled = false
--                 },
--                 jedi_references = {
--                     enabled = false
--                 },
--                 jedi_signature_help = {
--                     enabled = true
--                 },
--                 jedi_symbols = {
--                     enabled = true
--                 },
--                 mccabe = {
--                     enabled = false
--                 },
--                 preload = {
--                     enabled = false
--                 },
--                 pycodestyle = {
--                     enabled = true
--                 },
--                 pyflakes = {
--                     enabled = false
--                 },
--                 pylint = {
--                     enabled = false
--                 },
--                 rope_completion = {
--                     enabled = false
--                 },
--                 yapf = {
--                     enabled = true
--                 }
--             }
--         }
--     }
-- }

