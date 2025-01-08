{ pkgs
, inputs
, lib
, config
, ...
}: {
  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
  };
  environment.systemPackages = [pkgs.kitty];
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  hardware.graphics = let
    hyprpkgs = inputs.hyprland.inputs.nixpkgs.legacyPackages.${pkgs.stdenv.hostPlatform.system};
  in {
    package = hyprpkgs.mesa.drivers;
    package32 = lib.mkIf config.hardware.graphics.enable32Bit hyprpkgs.pkgsi686Linux.mesa.drivers;
  };

}
