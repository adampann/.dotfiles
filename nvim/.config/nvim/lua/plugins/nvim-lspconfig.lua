-- Define a reusable on_attach function
local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    local builtin = require('telescope.builtin')

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', builtin.lsp_definitions, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'gi', builtin.lsp_implementations, bufopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts) -- Use <C-k> or your preferred mapping
    -- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    -- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    -- vim.keymap.set('n', '<space>wl', function()
    --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    -- end, bufopts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, bufopts)
    -- vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', 'gr', builtin.lsp_references, bufopts)
    vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts) -- Requires formatting capabilities from the LSP server

    -- Example: Keymapping for going to next/previous diagnostic
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, bufopts)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, bufopts)
    -- vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, bufopts)

    vim.keymap.set('n', "==", vim.lsp.buf.format, bufopts)
    print("LSP attached to buffer " .. bufnr .. " for client " .. client.name)
end


return {
    'neovim/nvim-lspconfig',
    dependencies = { 'saghen/blink.cmp' },
    config = function()
        vim.lsp.enable({
            "lua_ls",
            "pyright",
        })
        vim.lsp.enable('prismals')
        vim.lsp.enable('ts_ls')
        vim.lsp.enable('rust_analyzer')
        -- vim.lsp.config("*", {
        --     on_attach = on_attach,
        -- })
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = vim.tbl_deep_extend('force', capabilities, require('blink.cmp').get_lsp_capabilities({}, false))

        capabilities = vim.tbl_deep_extend('force', capabilities, {
            textDocument = {
                foldingRange = {
                    dynamicRegistration = false,
                    lineFoldingOnly = true
                }
            }
        })

        vim.lsp.config("ts_ls", {
            on_attach = on_attach,
            capabilities = capabilities,
        })
        vim.lsp.config("lua_ls", {
            on_attach = on_attach,
            capabilities = capabilities
        })
        vim.lsp.config("rust_analyzer", {
            on_attach = on_attach,
            capabilities = capabilities
        })
    end
}
