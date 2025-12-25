{
  description = "github:udontur/umpire Nix flake";
  inputs.nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-25.05";

  outputs =
    { self, nixpkgs, ... }:
    let
      supportedSystems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];
      forAllSystems = nixpkgs.lib.genAttrs supportedSystems;
    in
    {
      packages = forAllSystems (
        system:
        let
          pkgs = import nixpkgs {
            inherit system;
          };
        in
        {
          default = pkgs.buildNpmPackage rec {
            pname = "pwa-electron";
            version = "1.0";
            src = self;
            npmDepsHash = "sha256-g9hGNS/D4rN2HSrFEdeKZ1+94ZOPFSv/vM7lJsK35Ac=";

            dontNpmBuild = true;

            env = {
              ELECTRON_SKIP_BINARY_DOWNLOAD = 1;
            };

            postInstall = ''
              makeWrapper ${pkgs.electron}/bin/electron $out/bin/${pname} \
                --add-flags $out/lib/node_modules/${pname}/src/main.js
            '';

            meta = {
              homepage = "https://github.com/udontur/${pname}";
              description = "Template that turns website into desktop apps with just a url (Nix)";
              mainProgram = pname;
              license = pkgs.lib.licenses.mit; # or gpl3
              platforms = pkgs.lib.platforms.all;
            };
          };
        }
      );
    };
}
