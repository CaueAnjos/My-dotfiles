{inputs, ...}: {
  imports = [
    inputs.home-manager.nixosModules.home-manager
  ];

  users.users.kawid = {
    isNormalUser = true;
    extraGroups = ["wheel"]; # Enable ‘sudo’ for the user.
  };

  home-manager = {
    extraSpecialArgs = {inherit inputs;};
    users.kawid = {
      imports = [./../home-manager/home.nix];
    };
  };
}
