This repo is used to store configs for neovim.

[New]

配置使用前提
1. neovim版本需要 >= 0.8.0
    1. `vim.keymap.set` 需要 neovim >= 0.7
    2. lazy.nvim 需要 neovim >= 0.8
2. 外部软件
    1. lazy.nvim插件需要luarocks

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
    
