{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-compat = {
      url = "github:edolstra/flake-compat";
      flake = false;
    };
  };

  outputs = {nixpkgs, ...}: let
    genSystems = nixpkgs.lib.genAttrs [
      "x86_64-linux"
      "x86_64-darwin"
    ];
  in {packages = genSystems (system: {default = nixpkgs.legacyPackages.${system}.callPackage ./package.nix {};});};
}
