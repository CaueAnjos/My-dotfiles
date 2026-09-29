{
  imports = [./modules/reverseScroll];

  hardware.scrollReversalFilter = {
    enable = true;
    confirmTicks = 8;
    windowMs = 100;
    debug = true;
    trace = true;
  };
}
