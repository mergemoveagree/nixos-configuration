{
  description = "Set up NixOS for personal use.";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  inputs.disko.url = "github:nix-community/disko";
  inputs.disko.inputs.nixpkgs.follows = "nixpkgs";

  inputs.home-manager.url = "github:nix-community/home-manager";
  inputs.home-manager.inputs.nixpkgs.follows = "nixpkgs";

  inputs.sops-nix.url = "github:Mic92/sops-nix";
  inputs.sops-nix.inputs.nixpkgs.follows = "nixpkgs";

  inputs.nixvim.url = "github:nix-community/nixvim";
  inputs.nixvim.inputs.nixpkgs.follows = "nixpkgs";

  inputs.hardware.url = "github:nixos/nixos-hardware";

  # Local pkgs
  inputs.lsp-ai.url = "path:pkgs/lsp-ai";
  inputs.lsp-ai.inputs.nixpkgs.follows = "nixpkgs";

  outputs = inputs@{ self, nixpkgs, home-manager, ... }:
  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
    inherit (nixpkgs) lib;
    specialArgs = {
      inherit
        inputs
      ;
    };
  in
  {
    nixosConfigurations = lib.mergeAttrsList [
      {
        thinkpadx1 = nixpkgs.lib.nixosSystem {
          inherit
            system
            specialArgs
          ;
          modules = [
            inputs.disko.nixosModules.disko
            ./configuration.nix
            ./hosts/thinkpadx1
          ];
        };
        malthor = nixpkgs.lib.nixosSystem {
          inherit
            system
            specialArgs
          ;
          modules = [
              inputs.disko.nixosModules.disko
              ./configuration.nix
              ./hosts/malthor
          ];
        };
        teemo = nixpkgs.lib.nixosSystem {
          system = "aarch64";
          inherit specialArgs;
          modules = [
            inputs.disko.nixosModules.disko
            ./configuration.nix
            ./hosts/teemo
          ];
        };
      }
      (lib.genAttrs [ "asrock" "asrock-install" ] (name: nixpkgs.lib.nixosSystem {
        inherit
          system
          specialArgs
        ;
        modules = [
          inputs.disko.nixosModules.disko
          ./configuration.nix
          ./hosts/${name}
        ];
      }))
    ];

    devShells.${system}.default = pkgs.mkShell {
      NIX_CONFIG = "extra-experimental-features = nix-command flakes";
      nativeBuildInputs = with pkgs; [
        git
        git-crypt
        sops
        gnupg
        age
        ssh-to-age
        pcsclite
        ccid
      ];
    };
  };
}
