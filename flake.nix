{
  description = "Nix flake for psets";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";

  outputs =
    { nixpkgs, ... }:
    let
      inherit (nixpkgs) lib;
      forAllSystems = f: lib.genAttrs lib.systems.flakeExposed (s: f nixpkgs.legacyPackages.${s});
    in
    {
      devShells = forAllSystems (pkgs: {
        default = pkgs.mkShell {
          name = "psets";

          packages = [
            pkgs.typst
            pkgs.tinymist
          ];
        };
      });
    };
}
