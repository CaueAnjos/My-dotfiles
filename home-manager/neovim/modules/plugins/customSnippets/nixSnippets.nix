[
  {
    trigger = "flake";
    body = ''
      {
        inputs.nixpkgs.url = "nixpkgs";
        inputs.flake-utils.url = "github:numtide/flake-utils";

        outputs = {
          nixpkgs,
          flake-utils,
          ...
        }:
          flake-utils.lib.eachDefaultSystem (system: let
            pkgs = nixpkgs.legacyPackages.$\{system};
            dotnet-sdk = pkgs.dotnetCorePackages.sdk_9_0;
          in {
            devShells.default = pkgs.mkShellNoCC {
              packages = with pkgs; [
                dotnet-sdk
                dotnet-ef
                csharpier
              ];
            };
          });
      }
    '';
  }
  {
    trigger = "dotnet-pkg";
    body = ''
      pkgs.buildDotnetModule {
          pname = "$1";
          version = "$2";
          src = ./.;
          projectFile = "src/$3";
          dotnet-sdk = pkgs.dotnetCorePackages.$4;
          nugetDeps = ./deps.json;
        };
      }
    '';
  }
  {
    trigger = "sdk-combine";
    body = ''
      (with dotnetCorePackages;
            combinePackages [
                $1
                $2
              ])
    '';
  }
  {
    trigger = "pkgs";
    body = ''
      pkgs = nixpkgs.legacyPackages.$\{system};
    '';
  }
  {
    trigger = "unstable";
    body = ''
      "github:NixOS/nixpkgs/nixpkgs-unstable"
    '';
  }
  {
    trigger = "channel";
    body = ''
      "github:NixOS/nixpkgs/$1"
    '';
  }
  {
    trigger = "stable";
    body = ''
      "https://flakehub.com/f/NixOS/nixpkgs/0"
    '';
  }
]
