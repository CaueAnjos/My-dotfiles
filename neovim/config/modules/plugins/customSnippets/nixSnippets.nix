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
]
