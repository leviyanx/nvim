require('telescope').load_extension 'file_browser'

vim.keymap.set('n', '<leader>kk', '<Cmd>Telescope find_files<CR>', {silent = true, desc = '查找文件'})
vim.keymap.set('n', '<leader>qq', '<Cmd>Telescope live_grep<CR>', {silent = true, desc = '按内容搜索（支持正则）'})
vim.keymap.set('n', '<leader>ss', '<Cmd>Telescope grep_string<CR>', {silent = true, desc = '以当前光标所在单词进行搜索'})
vim.keymap.set('n', '<leader>rr', '<Cmd>Telescope oldfiles<CR>', {silent = true, desc = '打开历史文件列表'})
vim.keymap.set('n', '<leader>mr', '<Cmd>Telescope marks<CR>', {silent = true, desc = '打开书签列表'})
vim.keymap.set('n', '<leader>fb', '<Cmd>Telescope file_browser<CR>', {silent = true, desc = '打开文件浏览器'})
vim.keymap.set('n', '<leader>fj', '<Cmd>Telescope jumplist<CR>', {silent = true, desc = '打开跳转列表'})
