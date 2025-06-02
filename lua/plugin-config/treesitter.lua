local M = {}

M.opts = {
    -- 支持的语言
    ensure_installed = {'c', 'cpp', 'python', 'java', 'lua', 'javascript', 'typescript', 'html', 'css', 'markdown', 'markdown_inline', 'json' },
    -- 启动代码高亮
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false
    },
    --启用增量选择
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = '<CR>',
            node_incremental = '<CR>',
            node_decremental = '<BS>',
            scope_incremental = '<TAB>'
        }
    },
    -- 启用基于 Treesitter 的代码格式化(选中后按=)
    indent = {
        enable = true
    },

}

return M
