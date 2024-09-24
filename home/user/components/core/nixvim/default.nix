/*
  Mostly copied from https://github.com/dc-tec/nixvim tbh <3
  but separated into multiple files
*/
{ inputs
, pkgs
, ...
}: let
  nixvim' = inputs.nixvim.legacyPackages.${pkgs.system};
  nvim = nixvim'.makeNixvimWithModule {
    inherit pkgs;
    module = ./config;
    extraSpecialArgs = {inherit inputs;};
  };
in {
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
  ];

  home.packages = [ nvim ];
}
