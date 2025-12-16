{inputs, ...}: {
  imports = [
    inputs.home-manager.nixosModules.home-manager
  ];

  users.users.kawid = {
    isNormalUser = true;
    extraGroups = ["wheel"]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
      ghostty
    ];
  };

  home-manager = {
    extraSpecialArgs = {inherit inputs;};
    users.kawid = {
      imports = [./../home-manager/home.nix];
    };
  };
}
