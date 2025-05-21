require('symbols-outline').setup()

-- 启动outline窗口快捷键
vim.keymap.set('n', '<leader>so', '<cmd>SymbolsOutline<CR>', {silent = true, desc = '打开/关闭symbol outline'})
