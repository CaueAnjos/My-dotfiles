{
  flake.modules.nixos.Keyring = {pkgs, ...}: {
    services.gnome.gnome-keyring.enable = true;

    programs.seahorse.enable = true;

    security.pam.services = {
      login.enableGnomeKeyring = true;
      hyprlock.enableGnomeKeyring = true;
    };

    environment.systemPackages = with pkgs; [
      libsecret
    ];
  };
}
