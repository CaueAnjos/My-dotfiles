{pkgs, ...}: {
  services.displayManager = {
    sddm = {
      enable = true;
      wayland.enable = true;
      theme = "${pkgs.sddm-astronaut}/share/sddm/themes/sddm-astronaut-theme";
      extraPackages = with pkgs; [
        sddm-astronaut
      ];
    };
  };
}
