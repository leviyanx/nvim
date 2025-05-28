local lspconfig = require('lspconfig')
local lsp_keymappings = require('lsp/keymappings')

local on_attach = function(_, bufnr)
    lsp_keymappings.set_keymap(bufnr)
end

lspconfig.eslint.setup {
    on_attach = on_attach
}
