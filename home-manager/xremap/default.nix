{inputs, ...}: {
  imports = [
    inputs.xremap-flake.homeManagerModules.default
    {
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
              "Super-T" = {
                launch = ["ghostty" "+new-window"];
              };
              "Super-B" = {
                launch = ["firefox"];
              };
            };
          }
          {
            name = "Global";
            remap = {
              "Ctrl-M" = "Enter";
            };
          }
        ];
      };
    }
  ];
}
