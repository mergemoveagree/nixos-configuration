{ inputs
, ...
}: {
  imports = [
    inputs.home-manager.nixosModules.home-manager
  ];

  home-manager.sharedModules = [
    inputs.sops-nix.homeManagerModules.sops
  ];

  home-manager.extraSpecialArgs = {
    inherit
      inputs
    ;
  };
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
}
