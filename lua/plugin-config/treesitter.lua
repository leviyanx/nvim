require('nvim-treesitter').setup({
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
})

-- 每次保存，自动格式化代码
local auto_indent = vim.api.nvim_create_augroup('AUTO_INDENT', {clear = true })
vim.api.nvim_create_autocmd({'BufWritePost'}, {
    -- 指定需要格式化的文件类型
    pattern = {'*.lua', '*.cpp', '*.c', '*.h', '*.hpp', '*.py', '*.java', '*.js', '*.ts', '*.go', '*.rs', '*.json'},
    group = auto_indent,
    command = 'normal! gg=G``'
})


-- 代码折叠设置
vim.opt.foldenable = true       -- 启用代码折叠
vim.opt.foldmethod = 'expr'     -- 设置折叠方法为基于语法 (也可以考虑 'indent' 或配合插件使用 'expr')
vim.opt.foldexpr = 'nvim_treesitter#foldexper()'
vim.opt.foldcolumn = '0'        -- 设置折叠区域的宽度 (可以设为 '1' 以显示折叠标记)
vim.opt.foldlevel = 99          -- 默认不折叠
vim.opt.foldlevelstart = 99     -- 打开文件时应用的折叠级别（99表示不折叠）
-- 使用空格键来切换折叠状态 (za 是更简单且常用的方式)
vim.keymap.set('n', '<Space>', 'za', { silent = true, desc = "切换代码折叠" })

