# 🚀 My NeoVim Configuration

> A beautiful and powerful Neovim setup built on [LazyVim](https://github.com/LazyVim/LazyVim)

## ✨ Features

This configuration is designed to transform Neovim into a full-featured IDE while maintaining its lightweight nature and blazing-fast performance.

- 🎨 Beautiful **Catppuccin Mocha** and **Gruvbox** themes with transparent background toggle
- 💻 Native LSP integration for multiple languages
- 🐍 Python development with Pyright and Ruff
- 🔍 Enhanced buffer navigation with Snipe
- 🏗️ Debugging capabilities with DAP
- 🔄 Powerful surround operations with mini-surround
- 📝 AI-assisted coding with Codeium

## 🔧 Key Technologies

- **Language Support**: Python, Go, C/C++, C#, JSON, SQL
- **Debugging**: DAP (Debug Adapter Protocol) with core and nlua extensions
- **Version Control**: Git integration
- **Completion**: Intelligent code completion
- **Navigation**: Snipe for buffer navigation
- **UI**: Indent guides, beautiful status line, transparent background options

## ⌨️ Custom Keymaps

| Keymap | Description |
|--------|-------------|
| `ç` | Goto mark (like `'`) |
| `<leader>çx` | Delete a specific mark |
| `gb` | Open Snipe buffer menu |
| `<leader>ut` | Toggle transparent background |

Plus all the standard [LazyVim keymaps](https://www.lazyvim.org/keymaps).

## 🎨 Appearance

This configuration includes:

- **Catppuccin Mocha**: A soothing pastel theme with:
  - Italic comments, conditionals, loops, and keywords
  - Bold functions and types
  - Special styling for LSP diagnostics

- **Gruvbox**: Set as the default colorscheme 

- **Transparency**: Toggle transparent background with `<leader>ut`

## 🧩 Plugin Extras

The following LazyVim extras are enabled:

- **AI & Coding**:
  - `lazyvim.plugins.extras.ai.codeium` - AI code completion
  - `lazyvim.plugins.extras.coding.mini-surround` - Surround operations
  - `lazyvim.plugins.extras.coding.yanky` - Improved yank and paste

- **Debugging**:
  - `lazyvim.plugins.extras.dap.core` - Debug adapter protocol
  - `lazyvim.plugins.extras.dap.nlua` - Lua debugging

- **Editor**:
  - `lazyvim.plugins.extras.editor.inc-rename` - Incremental rename

- **Languages**:
  - `lazyvim.plugins.extras.lang.clangd` - C/C++ support
  - `lazyvim.plugins.extras.lang.go` - Go support
  - `lazyvim.plugins.extras.lang.json` - JSON support
  - `lazyvim.plugins.extras.lang.omnisharp` - C# support
  - `lazyvim.plugins.extras.lang.python` - Python support with Pyright
  - `lazyvim.plugins.extras.lang.sql` - SQL support

- **UI**:
  - `lazyvim.plugins.extras.ui.indent-blankline` - Indent guides

## 🔌 Custom Plugins

- **[snipe.nvim](https://github.com/leath-dub/snipe.nvim)**: Quick buffer navigation
- **[nvim-transparent](https://github.com/xiyaowong/nvim-transparent)**: Toggle background transparency

## ⚙️ Custom Options

```lua
vim.o.shell = "pwsh"        -- Use PowerShell as shell
vim.opt.wrap = true         -- Enable line wrapping
```

## 🐍 Python Configuration

```lua
vim.g.lazyvim_python_lsp = "pyright"
vim.g.lazyvim_python_ruff = "ruff"
```

## 🚀 Installation

1. Make sure you have Neovim >= 0.9.0
2. Back up your existing Neovim configuration (if any)
3. Clone this repository:
   ```bash
   git clone https://github.com/CaueAnjos/MyNeoVimConfig.git ~/.config/nvim
   ```
4. Start Neovim:
   ```bash
   nvim
   ```
5. Wait for LazyVim to install all plugins

## 📋 Requirements

- Neovim >= 0.9.0
- Git
- A [Nerd Font](https://www.nerdfonts.com/) (optional, but recommended)
- PowerShell (configured as shell)
- Language servers (will be installed automatically)

## 💭 Acknowledgements

- [LazyVim](https://github.com/LazyVim/LazyVim) for the amazing base configuration
- [Catppuccin](https://github.com/catppuccin/nvim) for the beautiful colorscheme
- All plugin authors for their fantastic work

---

<p align="center">
  <img src="https://img.shields.io/badge/Made%20with-LazyVim-blueviolet?style=for-the-badge" alt="Made with LazyVim">
  <img src="https://img.shields.io/badge/Neovim-%2357A143.svg?&style=for-the-badge&logo=neovim&logoColor=white" alt="Neovim">
</p>
