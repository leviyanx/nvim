[New]

本配置目前完全适用Unix-like操作系统，部分插件在windows上可能不可用。

neovim安装方法（0.11.x）：

1、MacOS：brew

2、Linux：build from source

```bash
sudo apt update
sudo apt upgrade -y
sudo apt install ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl doxygen

cd ~/tmp
git clone https://github.com/neovim/neovim.git
cd neovim

#安装0.11.x
git checkout release-0.11

# 显示build细节
make CMAKE_BUILD_TYPE=RelWithDebInfo

sudo make install

nvim --version
```

3、Windows：github release下载msi安装。

配置使用前提

1. neovim版本需要 >= 0.11
   1. api: `vim.keymap.set`, `vim.api.nvim_create_augroup`, `vim.api.nvim_create_autocmd`: neovim >= 0.7
   2. lazy.nvim: neovim >= 0.8
   3. lualine.nvim: neovim >= 0.7
   4. telescope.nvim: neovim >= 0.9
   5. nvim-treesitter.nvim: neovim >= 0.10
   6. nvim-lspconfig.nvim: neovim >= 0.10
   7. mason-lspconfig: neovim >= 0.11
2. 外部软件
   1. [lazygit](https://github.com/jesseduffield/lazygit).
   2. telescope.nvim部分功能需要[ripgrep](https://github.com/BurntSushi/ripgrep)，如livegrep、grep string。ripgrep支持windows。
   3. nvim-treesitter.nvim需要tar、curl（或者git），以及C编辑器与libstdc++。[windows用户看这](https://github.com/nvim-treesitter/nvim-treesitter/wiki/Windows-support)。
   4. lazy.nvim插件部分功能需要luarocks。
3. 字体
   1. 一款[Nerd Font](https://www.nerdfonts.com/)。
      1. 下列插件需要：nvim-tree, lualine
      2. 推荐[hack字体](https://github.com/source-foundry/Hack)
      3. 设置Terminal使用该字体

使用配置方法

1. 将仓库clone到下列路径
   1. Linux/MacOS: ~/.config/nvim
   2. Win: ~/AppData/Local/nvim
2. 打开nvim

lsp支持

1. nvim-lspconfig.nvim lsp配置支持
2. mason.nvim, mason-lspconfig.nvim 快速安装不同语言lsp服务端
   1. nvim/lua/plugin-config/mason.lua 指定要安装的lsp服务端，会自动安装
3. nvim/lua/lsp/ lsp关于特定语言(如lua)的配置（需要于init.lua中引用）

特别说明：nvim/ftplugin/*.lua 特定文件类型定义局部于缓冲区的设置和行为，此处配置执行时间较晚，在neovim检测到文件类型后才会加载，不能用作加载lsp关于指定语言的接口。

dap支持

参考

1. 专栏 [零基础 vim 配置](https://blog.csdn.net/lanuage/category_11901740.html)

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
