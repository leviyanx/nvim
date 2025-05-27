local M = {}

M.opts = {
    -- 显示dotfiles
    filters = {
        dotfiles = false,
    },

    -- 以图标显示git 状态
    git = {
        enable = true
    }
}

M.configure = function()
    local nvimTreeGroup = vim.api.nvim_create_augroup("NvimTreeGroup", {clear = true})
    -- 关闭文件时，自动关闭nvim tree
    vim.api.nvim_create_autocmd("BufEnter", {
        group = nvimTreeGroup,
        nested = true,
        callback = function()
            if #vim.api.nvim_list_wins() == 1 and require("nvim-tree.utils").is_nvim_tree_buf() then
                vim.cmd "quit"
            end
        end
    })
end

return M
