require('gitsigns').setup({
    signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
    numhl      = true, -- Toggle with `:Gitsigns toggle_numhl`
    linehl     = true, -- Toggle with `:Gitsigns toggle_linehl`
    word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
    watch_gitdir = {
        interval = 1000,
        follow_files = true
    },

    attach_to_untracked = true,
    current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
    current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
        delay = 1000,
        ignore_whitespace = false,
    },
    current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',

    sign_priority = 6,
    update_debounce = 100,
    status_formatter = nil, -- Use default
    max_file_length = 40000, -- Disable if file is longer than this (in lines)
    preview_config = {
        -- Options passed to nvim_open_win
        border = 'single',
        style = 'minimal',
        relative = 'cursor',
        row = 0,
        col = 1
    },
    yadm = {
        enable = false
    },

    -- 快捷键
    on_attach = function()
        vim.keymap.set('n', 'gj', '<cmd>Gitsigns next_hunk<CR>', {silent = true, desc = '跳转到下一个修改'})
        vim.keymap.set('n', 'gk', '<cmd>Gitsigns prev_hunk<CR>', {silent = true, desc = '跳转到上一个修改'})
        vim.keymap.set('n', '<leader>hs', ':Gitsigns stage_hunk<CR>', {silent = true, desc = '暂存修改'})
        vim.keymap.set('v', '<leader>hs', ':Gitsigns stage_hunk<CR>', {silent = true, desc = '暂存修改'})
        vim.keymap.set('n', '<leader>hu', '<cmd>Gitsigns undo_stage_hunk<CR>', {silent = true, desc = '撤销暂存的修改'})
        vim.keymap.set('v', '<leader>hu', '<cmd>Gitsigns undo_stage_hunk<CR>', {silent = true, desc = '撤销暂存的修改'})
        vim.keymap.set('n', '<leader>hp', '<cmd>Gitsigns preview_hunk<CR>', {silent = true, desc = '预览修改'})
    end
})
