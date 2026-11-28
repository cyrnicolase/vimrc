# vimrc

个人 Vim 配置，基于 vim-plug + vim-lsp，覆盖 Go / Python / PHP 开发。

## 安装

```bash
$ curl -sS https://raw.githubusercontent.com/cyrnicolase/vimrc/refs/heads/main/install.sh | bash
```

安装完成后打开 Vim，执行 `:PlugInstall` 安装插件。

安装脚本做的事：克隆本仓库到 `~/.config/vim.d`，将 `~/.vimrc`、`~/.vim` 软链到仓库内对应文件（已有文件会备份为 `.bak`），并下载 vim-plug。

## 依赖

| 依赖 | 用途 | 安装 |
|---|---|---|
| Vim 9+、git、curl | 基础 | - |
| fzf、ripgrep | `Ctrl+p` 文件搜索、`,g` 全文搜索 | `brew install fzf ripgrep` |
| bat（可选） | fzf 预览语法高亮 | `brew install bat` |
| gopls、goimports | Go 补全/跳转/诊断/格式化 | `go install golang.org/x/tools/gopls@latest` |
| pylsp + black | Python 补全/诊断/格式化 | `pip install python-lsp-server black` |
| intelephense | PHP 补全/跳转/格式化 | `npm i -g intelephense` |

语言服务器缺失时对应语言的功能自动降级，不影响其他功能。

## 功能特性

- 语法高亮：Go（vim-go）、Nginx、TOML
- LSP：补全、跳转、悬停文档、诊断、保存时自动格式化
  - Go：gopls（保存时自动整理 imports + 格式化）
  - Python：pylsp（pyflakes 检查，black 格式化）
  - PHP：intelephense
- 模糊搜索：fzf（文件 / buffer / ripgrep 全文）
- NERDTree 文件树、floaterm 悬浮终端、vim-airline 状态栏、gruvbox 主题

## 快捷键

leader 键为 `,`。

### 通用

| 键位 | 功能 |
|---|---|
| `,t` | 新建 tab |
| `,x` | 关闭当前 buffer |
| `Tab` / `S-Tab` | 下一个 / 上一个 buffer |
| `F2` | NERDTree 文件树开关 |
| `F4` | 列出 buffers |
| `F7` | 打开内置终端 |
| `F12` | floaterm 悬浮终端开关 |
| `Ctrl+p` | fzf 文件搜索 |
| `,b` | fzf buffer 搜索 |
| `,g` | fzf ripgrep 全文搜索 |
| `S-R` | 运行当前脚本（目前支持 python） |
| `Esc`（结果列表窗口内） | 关闭 location list / quickfix 窗口 |

### 代码跳转（Go）

| 键位 | 功能 |
|---|---|
| `gd` / `Ctrl+]` | 跳转定义 |
| `gy` | 跳转类型定义 |
| `gi` | 跳转实现 |
| `gr` | 查找引用（结果列表中回车跳转，`:lnext` / `:lprev` 切换） |
| `K` | 悬停文档 |
| `Ctrl+t` | 返回跳转前位置 |

### Go 常用命令（vim-go）

| 命令 | 功能 |
|---|---|
| `:GoBuild` / `:GoTest` / `:GoCoverage` | 构建 / 测试 / 覆盖率 |
| `:GoAlternate` | 源码 ↔ 测试文件互跳 |
| `:GoAddTags` / `:GoRemoveTags` | 增删 struct tag |
| `:GoFmt` | 手动 goimports（保存时已自动格式化，一般用不到） |

## 目录结构

```
~/.config/vim.d
├── .vimrc                  # 入口
├── install.sh
└── .vim/
    ├── config/             # 基础选项、插件声明与配置
    ├── lsp/                # 各语言 LSP 服务器注册（go/python/php）
    ├── autoload/plug.vim   # vim-plug
    └── plugged/            # 插件目录
```

新增语言的 LSP：在 `.vim/lsp/` 下添加对应的 `.vim` 文件即可，`load.vim` 会自动加载。

## 更新

```bash
cd ~/.config/vim.d && git pull
```
