# My Dotfiles 🏠

NixOS and Home Manager configuration using flakes, flake-parts, and nvf (Neovim Framework).

Future update:

- [ ] use dentritic pattern
- [ ] use import-tree
- [ ] use nix-wrapper-modules

## What's Inside? 📦

### Desktop Environment

- **Hyprland** - Wayland compositor with smooth animations
- **Noctalia** - Customizable shell
- **Kitty** - Fast, GPU-accelerated terminal

### Development Tools
- **Neovim** (via nvf) - Fully configured with:
  - LSP support for language intelligence
  - Git integration (gitsigns, fugitive)
  - Fuzzy finding (fzf-lua)
  - Snippets and completion
  - Multiple status bars and tabs
- **Zellij** - Terminal multiplexer
- **Yazi** - Fast terminal file manager

### CLI Utilities
- **Eza** - Modern ls replacement
- **Bat** - Better cat with syntax highlighting
- **FZF** - Fuzzy finder
- **Btop** - Modern system monitor
- **Fastfetch** - Fast system info display
- **XRemap** - Key remapping for Wayland

### Additional Tools
- **Syncthing** - File synchronization
- **Obsidian** - Note-taking app
- **Stylix** - Consistent theming across applications (default theme: Gruvbox Dark Hard)

### Shell & Configs
- Shell aliases and functions
- Git configuration
- Devtools preferences
- NixOS system configuration (boot, networking, keyboard, display, virtualization)

## Installation 🚀

### Prerequisites

- Install Nix with flakes support
- Enable flakes and nix-command experimental feature (required for flakes)

### Clone & Apply

```shell
# Clone this repository
git clone https://github.com/kawid/My-dotfiles.git ~/dotfiles

# Apply Home Manager configuration
nix run home-manager -- switch --flake ~/dotfiles#kawid

# Restart your shell or log out/in
```
