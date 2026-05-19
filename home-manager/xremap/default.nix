{
  inputs,
  lib,
  pkgs,
  ...
}: {
  imports = [
    inputs.xremap-flake.homeManagerModules.default
  ];

  services.xremap = {
    enable = true;
    withGnome = true;
    config.modmap = [
      {
        name = "Global";
        remap = {
          "CapsLock" = {
            held = "Ctrl_R";
            alone = "Esc";
          };
        };
      }
    ];

    config.keymap = [
      {
        name = "Launch";
        remap = {
          "Super-T".launch = ["xdg-terminal-exec"];
          "Super-B".launch = [(lib.getExe pkgs.firefox)];
          "Super-Space".launch = ["noctalia-shell" "ipc" "call" "launcher" "toggle"];
        };
      }
      {
        name = "Global";
        remap = {
          "Ctrl-M" = "Enter";
          Ctrl-Shift-h = "Left";
          Ctrl-Shift-j = "Down";
          Ctrl-Shift-k = "Up";
          Ctrl-Shift-l = "Right";
        };
      }
    ];
  };
}
