require('nvim-tree').setup({
    -- 以图标显示git 状态
    git = {
        enable = true
    }
})

-- 关闭文件时，自动关闭nvim tree
vim.api.nvim_create_autocmd("BufEnter", {
  nested = true,
  callback = function()
    if #vim.api.nvim_list_wins() == 1 and require("nvim-tree.utils").is_nvim_tree_buf() then
      vim.cmd "quit"
    end
  end
})

-- 打开/关闭nvim tree
vim.keymap.set('n', '<leader>xf', ':NvimTreeToggle<CR>', { silent = true })
