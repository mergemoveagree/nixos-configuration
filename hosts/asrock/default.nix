{ config
, pkgs
, inputs
, ...
}:
{
  imports = [
    inputs.hardware.nixosModules.common-cpu-intel-cpu-only
    inputs.hardware.nixosModules.common-gpu-amd
    ../components/core
    ./disk-config.nix
    ./hardware-configuration.nix
    ../components/optional/home-manager.nix
    ../components/optional/mullvad-vpn.nix
    ../components/optional/hyprland
    ../components/optional/gaming
    ../components/optional/bluetooth.nix
    ../components/users/user
  ];

  networking.hostName = "asrock";

  programs.dconf.enable = true;

  # Kernel module for TP-LINK USB WiFi Adapter
  boot.extraModulePackages = [ config.boot.kernelPackages.rtl8852au ];
  # Needed for USB WiFi adapter to work
  hardware.usb-modeswitch.enable = true;

  users.users.user.extraGroups = [
    "gamemode"
  ];

  # OpenRGB
  services.hardware.openrgb = {
    enable = true;
    package = pkgs.openrgb-with-all-plugins;
    motherboard = "intel";
  };
}
