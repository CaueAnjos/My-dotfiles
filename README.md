# My Dotfiles 🏠

NixOS and Home Manager configuration using flakes, flake-parts, and nvf (Neovim Framework).

## What's Inside? 📦

### Desktop Environment
- **Hyprland** - Wayland compositor with smooth animations
- **Waybar** - Customizable status bar
- **Ghostty** - Fast, GPU-accelerated terminal

### Development Tools
- **Neovim** (via nvf) - Fully configured with:
  - LSP support for language intelligence
  - Git integration (gitsigns, fugitive)
  - Fuzzy finding (telescope)
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
- **Walker** - Application launcher
- **XRemap** - Key remapping for Wayland

### Additional Tools
- **Syncthing** - File synchronization
- **Obsidian** - Note-taking app
- **Nix-colors** - Consistent theming across applications

### Shell & Configs
- Shell aliases and functions
- Git configuration
- Devtools preferences
- NixOS system configuration (boot, networking, keyboard, display, virtualization)

## Installation 🚀

### Prerequisites

Install Nix with flakes support:

```shell
# Using the Determinate Systems installer (recommended)
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh

# Or using the official Nix installer
sh <(curl -L https://nixos.org/nix/install)
```

Enable flakes and nix-command experimental feature (required for flakes):

```shell
mkdir -p ~/.config/nix
echo 'experimental-features = nix-command flakes' > ~/.config/nix/nix.conf
```

### Clone & Apply

```shell
# Clone this repository
git clone https://github.com/kawid/My-dotfiles.git ~/dotfiles

# Apply Home Manager configuration
nix run home-manager -- switch --flake ~/dotfiles#kawid

# Restart your shell or log out/in
```

To update in the future:

```shell
nix run home-manager -- switch --flake ~/dotfiles#kawid
```

## Structure 📁

```
.
├── flake.nix                 # Flake configuration
├── flake-parts/              # Flake-parts modules
├── nixos/                    # NixOS system configuration
│   ├── configuration.nix
│   ├── boot.nix
│   ├── services.nix
│   ├── users.nix
│   ├── network.nix
│   ├── keyboard.nix
│   ├── display-manager.nix
│   ├── hardware-configuration.nix
│   └── virtualisation.nix
└── home-manager/             # User configuration
    ├── home.nix              # Main home-manager config
    ├── hyprland/
    ├── neovim/               # nvf-based Neovim config
    ├── waybar/
    ├── walker/
    ├── xremap/
    ├── zellij/
    ├── yazi/
    ├── ghostty/
    ├── eza/
    ├── bat/
    ├── fastfetch/
    ├── fzf/
    ├── btop/
    ├── syncthing/
    ├── obsidian/
    ├── shell/
    ├── git/
    └── colorscheme.nix
```

## Key Features ⭐

- **Reproducible** - Nix guarantees the same environment everywhere
- **Modular** - flake-parts for clean, composable configuration
- **Wayland-native** - Hyprland compositor with modern Wayland tools
- **Optimized** - Fastfetch, btop, and efficient tooling

---

_Happy coding!_ 💻
