local opt = require('toggleterm').setup({
    open_mapping = [[<C-t>]],
    -- 打开新终端后自动进入插入模式
    start_in_insert = true,
    -- 在当前buffer的下方打开新终端
    direction = 'horizontal'
})

-- 自定义终端
local Terminal = require('toggleterm.terminal').Terminal
-- lazygit
local lazygitterm = Terminal:new({
    cmd = 'lazygit',
    direction = 'float'
})

function lazygit_toggle()
    lazygitterm:toggle()
end

vim.keymap.set('n', '<leader>lg', '<cmd>lua lazygit_toggle()<CR>', {silent = true, desc = '打开lazygit窗口'})
