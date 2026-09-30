{
  imports = [./modules/reverseScroll];

  hardware.scrollReversalFilter = {
    enable = true;
    confirmTicks = 10;
    windowMs = 300;
    debug = true;
    trace = true;
  };
}
