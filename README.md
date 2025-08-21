# My-dotfiles
This repo contains my configuration files

## Getting Started

Install nix and run these commands:

```shell
nix run nixpkgs#gh -- auth login
nix run nixpkgs#gh -- repo clone CaueAnjos/My-dotfiles
nix run home-manager -- switch -- flake My-dotfiles#kawid
```

Then, I recommend you to run `chsh -s /home/kawid/.nix-profile/bin/zsh` to set `zsh` as your default shell. 
Oh, there is another tip. If your are on WSL2, I recommend your to add this to `etc/wls.conf`:

```toml
[interop]
appendWindowsPath = false
```

this will fix some performace issues.
