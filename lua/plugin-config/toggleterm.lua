require('toggleterm').setup({
    open_mapping = [[<C-\>]],
    -- 打开新终端后自动进入插入模式
    start_in_insert = true,
    -- 在当前buffer的下方打开新终端
    direction = 'horizontal'
})
