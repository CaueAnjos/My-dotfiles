{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.hardware.scrollReversalFilter;

  # The plugin sandbox has no io, so configuration is baked in as a Lua header.
  header = pkgs.writeText "scroll-reversal-filter-header.lua" ''
    local CONFIG = {
      window_us = ${toString (cfg.windowMs * 1000)},
      confirm_ticks = ${toString cfg.confirmTicks},
      debug = ${lib.boolToString cfg.debug},
      trace = ${lib.boolToString cfg.trace},
      devices = {
    ${lib.concatMapStringsSep "\n" (d: "    { vid = 0x${d.vid}, pid = 0x${d.pid} },") cfg.devices}
      },
    }
  '';

  # Header + static body, parsed with luac at build time so a syntax error
  # fails the build instead of silently unloading the plugin at runtime.
  #
  # Uses lua5_5, not lua5_4: Hyprland links liblua.so.5.5 directly (its own
  # hyprland.lua config support). Aquamarine calls
  # libinput_plugin_system_load_plugins() unconditionally when it opens the
  # session, so stock libinput (linked against lua5_4) ends up loaded in the
  # same process as Hyprland's lua5_5. Lua's C API exports unversioned
  # symbols, so having two different Lua builds in one process makes the
  # dynamic linker resolve libinput's Lua calls against the wrong
  # interpreter, corrupting the lua_State and segfaulting the instant
  # libinput tries to load any plugin -- before the plugin's own code even
  # runs. Forcing libinput onto the same lua5_5 derivation as Hyprland (see
  # the overlay below) avoids the clash entirely.
  plugin =
    pkgs.runCommand "50-scroll-reversal-filter.lua"
    {nativeBuildInputs = [pkgs.lua5_5];}
    ''
      cat ${header} ${./scroll-reversal-filter.lua} > $out
      luac -p $out
    '';
in {
  options.hardware.scrollReversalFilter = {
    enable = lib.mkEnableOption "the libinput Lua plugin that drops spurious reverse mouse-wheel ticks";

    windowMs = lib.mkOption {
      type = lib.types.ints.positive;
      default = 100;
      description = ''
        An opposite-direction wheel tick arriving within this many
        milliseconds of the previous tick is withheld until the next tick
        shows whether it was a glitch or a real reversal. Raise it if
        glitches still slip through; lower it if quick deliberate
        single-notch reversals get swallowed.
      '';
    };

    confirmTicks = lib.mkOption {
      type = lib.types.ints.between 2 10;
      default = 2;
      description = ''
        How many consecutive opposite-direction ticks (each within `windowMs`
        of the previous one) are needed before a reversal is treated as
        genuine. Raise it if your mouse emits bursts of several reverse ticks.
        A genuine reversal shorter than this many notches is dropped, and a
        longer one is passed through losslessly.
      '';
    };

    devices = lib.mkOption {
      type = lib.types.listOf (lib.types.submodule {
        options = {
          vid = lib.mkOption {
            type = lib.types.strMatching "[0-9a-fA-F]{4}";
            example = "046d";
            description = "USB vendor ID, 4 hex digits (see `libinput list-devices` or lsusb).";
          };
          pid = lib.mkOption {
            type = lib.types.strMatching "[0-9a-fA-F]{4}";
            example = "c077";
            description = "USB product ID, 4 hex digits.";
          };
        };
      });
      default = [];
      description = ''
        Restrict the filter to these devices. Empty means every pointer
        device that has a scroll wheel.
      '';
    };

    debug = lib.mkEnableOption "log dropped and confirmed ticks at libinput's info priority";

    trace = lib.mkEnableOption "log every vertical wheel frame (direction, values, time since previous tick) at libinput's info priority, for diagnosing the glitch pattern";
  };

  config = lib.mkIf cfg.enable {
    environment.etc."libinput/plugins/50-scroll-reversal-filter.lua".source = plugin;

    # Aquamarine (Hyprland's backend) calls libinput_plugin_system_load_plugins()
    # itself as soon as it opens the session, unconditionally -- there is no
    # build flag to opt out of that. Since Hyprland links lua5_5 directly for
    # its own hyprland.lua config support, stock libinput (linked against
    # lua5_4) loading a plugin in the same process is a guaranteed crash: Lua's
    # C API has unversioned symbols, so the dynamic linker resolves libinput's
    # calls against whichever liblua got loaded first, corrupting the
    # lua_State. Rebuilding libinput against the same lua5_5 derivation
    # Hyprland already uses removes the second, incompatible Lua runtime from
    # the process entirely.
    nixpkgs.overlays = [
      (final: prev: {
        libinput = prev.libinput.override {lua5_4 = final.lua5_5;};
      })
    ];
  };
}
