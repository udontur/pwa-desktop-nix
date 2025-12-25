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
          # vvv CHANGE THE APPLICATION NAME HERE
          name = "APP_NAME";
          # ^^^ CHANGE THE APPLICATION NAME HERE
          pkgs = import nixpkgs {
            inherit system;
          };
          desktopFile = ''
            [Desktop Entry]
            Type=Application
            Name=${name}
            Exec=$out/bin/${name}
            Icon=./src/icon.svg
            Terminal=false
          '';
        in
        {
          default = pkgs.buildNpmPackage rec {
            pname = name;
            version = "1.0";
            src = self;
            npmDepsHash = "sha256-g9hGNS/D4rN2HSrFEdeKZ1+94ZOPFSv/vM7lJsK35Ac=";

            dontNpmBuild = true;

            env = {
              ELECTRON_SKIP_BINARY_DOWNLOAD = 1;
            };

            postInstall = ''
              makeWrapper ${pkgs.electron}/bin/electron $out/bin/${pname} \
                --add-flags $out/lib/node_modules/pwa-electron/src/main.js

              mkdir -p $out/share/applications
              echo "${desktopFile}" > $out/share/applications/${pname}.desktop
            '';

            meta = {
              homepage = "https://github.com/udontur/${pname}";
              mainProgram = pname;
              license = pkgs.lib.licenses.mit;
              platforms = pkgs.lib.platforms.all;
            };
          };
        }
      );
    };
}
