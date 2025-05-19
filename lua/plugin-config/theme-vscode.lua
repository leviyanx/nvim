local c = require('vscode.colors')
require('vscode').setup({
    -- 允许背景透明
    transparent = true,
    -- 注释使用斜体
    italic_comments = true,
    -- 禁用nvim-tree背景色
    disable_nvimtree_bg = true,
    -- 重写部分元素配色
    color_overrides = {
        vscLineNumber = '#FFFFFF',
    },
})
