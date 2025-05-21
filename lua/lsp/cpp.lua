local lspconfig = require('lspconfig')
local lsp_keymappings = require("keymappings")

local on_attach = function(_, bufnr)
    lsp_keymappings.set_keymap(bufnr)
end

lspconfig.clangd.setup {
    on_attach = on_attach
}
