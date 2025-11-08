{inputs, ...}: {
  perSystem = {pkgs, ...}: {
    packages.neovim =
      (inputs.nvf.lib.neovimConfiguration {
        inherit pkgs;
        modules = [./config];
        extraSpecialArgs = {
          inherit inputs;
        };
      }).neovim;
  };
}
