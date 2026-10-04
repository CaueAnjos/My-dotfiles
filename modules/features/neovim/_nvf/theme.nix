{
  pkgs,
  lib,
  config,
  ...
}: let
  inherit (config.vim) palette;
  hash = lib.mapAttrs (_: c: "#${c}");

  baseNames = map (n: "base0${n}") (lib.stringToCharacters "0123456789ABCDEF");
in {
  options.vim.palette = lib.mkOption {
    type = lib.types.attrs;
    description = "base16 palette (base00..base0F), hex without the leading '#'.";
    apply = p: lib.genAttrs baseNames (n: p.${n}); # drops extra attrs (stylix adds many)
  };

  config.vim = {
    theme = {
      enable = true;
      name = "base16";
      base16-colors = hash palette;
    };

    # runs after the theme is set up
    luaConfigRC.highlights =
      lib.nvim.dag.entryAfter ["theme"]
      /*
      lua
      */
      ''
        local function apply_highlights()
          local groups = {
            ["@variable"]                 = { fg = "#${palette.base04}" },
            ["@variable.member"]          = { fg = "#${palette.base0D}" },
            ["@variable.parameter"]       = { fg = "#${palette.base0A}", italic = true },
            ["@keyword"]                  = { fg = "#${palette.base0E}", italic = true },
            ["@keyword.import"]           = { fg = "#${palette.base0E}", italic = true },
            ["@type"]                     = { fg = "#${palette.base0C}" },
            ["@operator"]                 = { fg = "#${palette.base09}" },

            -- lsp semantic tokens
            ["@lsp.type.property"]        = { link = "@variable.member" },
            ["@lsp.type.variable"]        = { link = "@variable" },
            ["@lsp.type.interface"]       = { link = "@type" },
            ["@lsp.type.class"]           = { link = "@type" },
            ["@lsp.type.namespace"]       = { link = "@type" },
          }
          for group, opts in pairs(groups) do
            vim.api.nvim_set_hl(0, group, opts)
          end
        end

        apply_highlights()
        vim.api.nvim_create_autocmd("ColorScheme", { callback = apply_highlights })
      '';

    lazy.plugins."transparent.nvim" = {
      package = pkgs.vimPlugins.transparent-nvim;
      event = "BufEnter";
      priority = 1000;
      setupModule = "transparent";
      setupOpts = {
        extra_groups = [
          "FloatBorder"
          "GitSignsAdd"
          "GitSignsChange"
          "GitSignsDelete"
          "GitSignsChangedelete"
          "GitSignsTopdelete"
          "GitSignsUntracked"
          "GitSignsAddNr"
          "ErrorMsg"
        ];
        exclude_groups = ["StatusLine" "StatusLineNC" "NotifyBackground"];
      };
      after =
        /*
        lua
        */
        ''
          local ok, notify = pcall(require, "notify")
          if ok then
            notify.setup({ background_colour = "#${config.vim.palette.base00}" })
          end
          vim.cmd("TransparentEnable")
        '';
    };

    statusline.lualine.enable = true;
  };
}
