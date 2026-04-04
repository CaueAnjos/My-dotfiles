# AGENTS.md

This repository is a NixOS + Home Manager dotfiles setup.
It uses flakes, flake-parts, Home Manager, and nvf for Neovim.

Use this file as the operating guide for agentic changes in this repo.

## Repository map

- `flake.nix` wires the flake inputs and imports `nixos/` and `home-manager/`.
- `nixos/` contains the system config for the host `PCCaueNixos`.
- `home-manager/` contains the user config for `kawid`.
- `home-manager/neovim/` holds the nvf-based Neovim setup and plugin modules.
- `home-manager/waybar/`, `hyprland/`, `ghostty/`, `zellij/`, `yazi/`, etc. are app modules.
- `README.md` describes the intended environment, but it is not the source of truth.

## Important repo notes

- No `.cursor/rules/`, `.cursorrules`, or `.github/copilot-instructions.md` files were present when this guide was written.
- The flake currently contains a typo in one input URL: `githyb:Mic92/sops-nix`.
- If flake commands fail with an unsupported-input error, fix that typo first.
- There is no dedicated test suite in the usual app sense; validation is mainly flake evaluation and config builds.

## Common commands

Run these from the repository root.

- Show flake outputs:
  - `nix flake show`
- Check the whole flake:
  - `nix flake check`
- Build the Home Manager activation package:
  - `nix build .#homeConfigurations.kawid.activationPackage`
- Build the NixOS system closure:
  - `nix build .#nixosConfigurations.PCCaueNixos.config.system.build.toplevel`
- Apply the Home Manager config:
  - `home-manager switch --flake .#kawid`
- Apply the NixOS config:
  - `sudo nixos-rebuild switch --flake .#PCCaueNixos`

## Single-test / single-target workflow

Use the smallest build that covers the change.

- Home-only change:
  - `nix build .#homeConfigurations.kawid.activationPackage`
- System-only change:
  - `nix build .#nixosConfigurations.PCCaueNixos.config.system.build.toplevel`
- Quick evaluation check for a module or option:
  - `nix eval .#homeConfigurations.kawid.pkgs.system`
  - `nix eval .#nixosConfigurations.PCCaueNixos.config.system.stateVersion`
- If you only changed one module, prefer the corresponding target build over `nix flake check` when you want faster feedback.
- There are no repo-local unit test files to run individually.

## Formatting and linting

- There is no explicit formatter configured in the flake outputs.
- Follow the existing Nix style manually.
- If you add a formatter later, document the exact command here and in the flake.
- For shell snippets embedded in Nix strings, keep them POSIX/Bash-compatible unless the module clearly needs Bash-specific behavior.

## Nix style guide

- Use two-space indentation throughout Nix files.
- Prefer multiline attribute sets and argument sets once they exceed one line.
- Keep braces and lists compact when they remain readable.
- Sort imports and module lists in a deliberate order.
- Prefer `default.nix` for directory entry points.
- Use `let ... in` for local helpers and derived values.
- Use `inherit` when it improves readability and avoids repetition.
- Prefer explicit module arguments such as `{ pkgs, lib, config, ... }`.
- Use `with pkgs;` mainly for package lists and closely scoped package imports.
- Keep option names aligned with upstream NixOS/Home Manager/nvf naming.
- Use lower-case attribute names for module keys unless the upstream option requires otherwise.

## Naming conventions

- Use descriptive module filenames like `network.nix`, `services.nix`, `theme.nix`, or `default.nix`.
- Use directory names that match the feature area: `neovim`, `waybar`, `hyprland`, `walker`, `xremap`.
- Keep host-specific names stable; current host names are `kawid` and `PCCaueNixos`.
- Prefer short, clear variable names for computed values (`palette`, `hexToRgba`, `toggleInhibitor`).
- Use booleans with `enable` flags and nested submodule attributes when the upstream module expects them.

## Imports and module structure

- Keep top-level module files small and composable.
- Prefer splitting large feature areas into submodules under a dedicated directory.
- Re-export or aggregate related modules through a single `default.nix` where useful.
- Group imports by feature instead of mixing unrelated concerns.
- Keep cross-cutting constants in one place when they are reused across multiple modules.

## Formatting of lists and sets

- Put one item per line in long lists.
- Put one attribute per line in long attrsets.
- Keep string values quoted with double quotes.
- Use multiline strings for shell snippets, config blobs, and Lua fragments.
- Keep embedded Lua or shell heredocs indented consistently with surrounding Nix code.

## Types and values

- This repo is mostly Nix expressions, so explicit typing is rare.
- Prefer stable literal values over computed magic when a value is a fixed config constant.
- Use `lib.mkLuaInline` only when an option truly needs raw Lua.
- Keep color and theme values in the color scheme module instead of duplicating them.
- Prefer `pkgs.writeShellApplication` for non-trivial scripts instead of inline `runCommand` style snippets.

## Shell and script conventions

- Quote shell variables unless there is a specific reason not to.
- Prefer `set -euo pipefail` in standalone scripts unless the logic requires different behavior.
- Use `set +u` only when the script intentionally depends on unset-variable behavior.
- Keep shell scripts short and purpose-built.
- Prefer `notify-desktop`, `wpctl`, `systemctl`, and other existing tools already used by the repo.
- Avoid introducing new shell dependencies when an existing package already covers the same use case.

## Error handling

- Fail early for invalid assumptions in Nix expressions when needed.
- Use `assert` or option validation only when it improves clarity for future maintainers.
- Prefer explicit module options over hidden behavior.
- In scripts, surface failures through exit codes rather than silent fallback behavior.
- When a command can fail in normal use, handle that failure locally and keep the failure mode obvious.

## Comments

- Keep comments short and explain intent, not obvious syntax.
- Use comments for unusual workarounds, host-specific behavior, or non-obvious config choices.
- Avoid restating what the code already says.
- Preserve existing comments that explain why a setting matters, especially in `nixos/` and keymap modules.

## Editing workflow for agents

- Read the smallest relevant set of files before changing anything.
- Preserve unrelated user changes.
- Prefer small, focused edits over broad rewrites.
- After changing Nix code, run the most specific build command that exercises the change.
- If you touch shared config like `flake.nix` or `home-manager/home.nix`, validate the relevant downstream target too.

## Practical validation checklist

- Check the changed module for formatting and consistency.
- Build the relevant Home Manager or NixOS target.
- Re-run `nix flake check` only when the change is broad enough to justify full validation.
- Update `README.md` only if the user-facing workflow changed.

## If you are unsure

- Follow the existing local style in the nearest file.
- Match surrounding indentation, naming, and option layout.
- Prefer the smallest change that solves the problem.
- When in doubt about a repository convention, inspect a neighboring module first.
