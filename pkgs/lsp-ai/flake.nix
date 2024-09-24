{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-compat = {
      url = "github:edolstra/flake-compat";
      flake = false;
    };
  };

  outputs = {self, nixpkgs, ...}: let
    genSystems = nixpkgs.lib.genAttrs [
      "x86_64-linux"
      "x86_64-darwin"
    ];
    pkgsFor = system: let
      pkgs = import nixpkgs {
        inherit system;
        overlays = [ self.overlays.default ];
      };
      overlay = self.overlays.default pkgs pkgs;
    in overlay;
  in {
    overlays.default = import ./overlay.nix;
    packages = genSystems pkgsFor;
  };
}
