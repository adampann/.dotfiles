-- defines what capabilities our lsp client (neovim) has
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', '<space>dn', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>dp', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', '<space>dl', "<cmd>Telescope diagnostics<cr>", opts)
-- vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts) -- Not using becasue <space>q is already used to quit nvim

local get_bufopts = function(bufnr, desc)
  return { noremap=true, silent=true, buffer=bufnr, desc=desc}
end

local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr, desc=''}
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, get_bufopts(bufnr, "vim.lsp.buf.hover"))
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, get_bufopts(bufnr, "vim.lsp.buf.declaration"))
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, get_bufopts(bufnr, "vim.lsp.buf.definition"))
  vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, get_bufopts(bufnr, "vim.lsp.buf.type_definition"))
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, get_bufopts(bufnr, "vim.lsp.buf.implementation"))
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, get_bufopts(bufnr, "vim.lsp.buf.references"))
  vim.keymap.set('n', '<C-s>', vim.lsp.buf.signature_help, get_bufopts(bufnr, "vim.lsp.buf.signature_help"))
  -- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  -- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  -- vim.keymap.set('n', '<space>wl', function()
  --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  -- end, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', '<space>fo', vim.lsp.buf.formatting, bufopts)
end

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}
require('lspconfig')['pyright'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
    capabilities = capabilities,
}
require('lspconfig')['tsserver'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
    capabilities = capabilities,
}
require('lspconfig')['sumneko_lua'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
    capabilities = capabilities,
    settings = {
    Lua = {
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}
