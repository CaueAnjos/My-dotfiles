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
      };
    }
  ];
}
