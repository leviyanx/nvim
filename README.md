This repo is used to store configs for neovim.

[New]

配置使用前提
1. neovim版本需要 >= 0.9.0
    1. api: `vim.keymap.set`, `vim.api.nvim_create_augroup`, `vim.api.nvim_create_autocmd`: neovim >= 0.7
    2. lazy.nvim: neovim >= 0.8
    3. lualine.nvim: neovim >= 0.7
    4. telescope.nvim: neovim >= 0.9
2. 外部软件
    1. lazy.nvim插件需要luarocks
    2. telescope.nvim需要ripgrep
3. 字体
    1. 一款[Nerd Font](https://www.nerdfonts.com/)
        1. 下列插件需要：nvim-tree, lualine
        2. 安装方式：https://github.com/ryanoasis/nerd-fonts?tab=readme-ov-file#various-download-options-for-fonts
        3. 设置Terminal使用该字体

---
[Old]
Required environment

1. python3
2. node.js

Steps

1. Git clone this repo in these paths.
    * Win: ~/AppData/Local/nvim
    * Linux/MacOS: ~/.config/nvim
2. Open neovim, execute command: `PlugInstall`.
3. Execute command `CocUpdate` to install coc plugins, if **fail** to install some plugins, you can install them **manually** by executing command `CocInstall <plugin-name>`.
    
