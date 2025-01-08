{
  description = "Set up NixOS for personal use.";

  inputs  = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };

    hyprland-easymotion = {
      url = "github:zakk4223/hyprland-easymotion";
      inputs.hyprland.follows = "hyprland";
    };

    hardware.url = "github:nixos/nixos-hardware";

    # Local pkgs
    lsp-ai = {
      url = "path:pkgs/lsp-ai";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

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
    nixosConfigurations = {
      asrock = lib.nixosSystem {
        inherit
          system
          specialArgs
        ;
        modules = [
          inputs.disko.nixosModules.disko
          ./configuration.nix
          ./hosts/asrock
        ];
      };
      thinkpadx1 = lib.nixosSystem {
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
      malthor = lib.nixosSystem {
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
      teemo = lib.nixosSystem {
        system = "aarch64";
        inherit specialArgs;
        modules = [
          inputs.disko.nixosModules.disko
          ./configuration.nix
          ./hosts/teemo
        ];
      };
    };

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
