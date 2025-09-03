# My-dotfiles 🏠✨

Welcome to my digital home! This repository contains my carefully curated
configuration files - the secret sauce that makes my terminal feel like a cozy
living room instead of a sterile command prompt.

## What's Inside? 📦

Think of this as my "digital DNA" - all the configs, tweaks, and customizations
that make my development environment uniquely mine. From shell aliases that save
me 0.3 seconds per command (which totally adds up!) to color schemes that don't
burn my retinas during 3 AM coding sessions.

## Getting Started 🚀

Ready to transform your bland terminal into a productivity powerhouse? Let's get
this party started!

### Prerequisites

First things first - you'll need Nix installed. If you don't have it yet, head
over to [nixos.org](https://nixos.org/download.html) and follow their
installation guide, or use the
[Determinate Systems installer](https://docs.determinate.systems/), which is my
preferred way. Don't worry, it's easier than assembling IKEA furniture.

### Installation Steps

Once you've got Nix ready to rock, fire up your terminal and run these magical
spells, little wizard 🧙‍♂️:

```shell
# Summon git from the Nix dimension
nix shell nixpkgs#git

# Authenticate with GitHub (because we're not savages)
nix run nixpkgs#gh -- auth login

# Clone this masterpiece to your local machine
nix run nixpkgs#gh -- repo clone CaueAnjos/My-dotfiles

# Apply the configs and watch the magic happen ✨
nix run home-manager -- switch --flake My-dotfiles#kawid

# Exit to let the changes take effect
exit
```

### Post-Installation Polish 🎨

Now for the finishing touches that'll make your shell sing:

#### Make Zsh Your Default Shell

Because life's too short for bash (just kidding, bash lovers - you do you!):

1. Add the Nix-managed zsh to your system's approved shells list:

```shell
echo "/home/kawid/.nix-profile/bin/zsh" | sudo tee -a /etc/shells
```

1. Set zsh as your default shell:

```shell
chsh -s /home/kawid/.nix-profile/bin/zsh
```

1. Log out and back in to see the magic happen! 🎭

#### WSL2 Performance Boost 🏎️

If you're running this on Windows WSL2 (brave soul!), here's a pro tip to make
your terminal highlighting faster than a caffeinated cheetah:

Add this snippet to `/etc/wsl.conf`:

```toml
[interop]
appendWindowsPath = false
```

**Why does this help?** WSL2 normally inherits Windows' PATH, which can make
command lookups slower than a dial-up modem. This setting tells WSL2 to focus on
its own PATH, dramatically improving terminal responsiveness.

After adding this, restart your WSL2 instance:

```shell
# From Windows PowerShell/CMD
wsl --shutdown
# Then start WSL2 again
```

## Troubleshooting 🔧

### "Command not found" errors

- Make sure you've exited and re-entered your shell after installation
- Check that `/home/kawid/.nix-profile/bin` is in your PATH

### WSL2 still feeling sluggish?

- Double-check that `/etc/wsl.conf` change and restart WSL2
- Consider using Windows Terminal for better performance

### Something's broken?

- File an issue! I promise I don't bite (much)
- Include your OS, shell version, and what you were trying to do

## What Makes These Dotfiles Special? ⭐

- **Nix-powered**: Reproducible configurations that work the same everywhere
- **Performance-optimized**: Because waiting for your terminal is so last decade
- **Carefully curated**: Years of tweaking distilled into pure productivity gold
- **WSL2-friendly**: Plays nice with Windows Subsystem for Linux

## Contributing 🤝

Found a bug? Have a suggestion? Want to add support for your favorite tool? Pull
requests are welcome! Just remember: with great power comes great responsibility
(and decent commit messages).

---

_Happy configuring! May your terminal be fast and your syntax highlighting be
colorful._ 🌈
