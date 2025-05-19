This repo is used to store configs for neovim.

[New]

配置的前置要求
1. Neovim >= 0.8.0 (needs to be built with LuaJIT)
1. lazy插件需要luarocks

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
    
