{
  services.xserver = {
    enable = true;
    xkb = {
      layout = "br";
      variant = "abnt2";
      options = "nodeadkeys";
    };
  };
}
