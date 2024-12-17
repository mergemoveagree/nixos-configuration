{ config
, inputs
, lib
, ...
}:
{
  imports = [
    inputs.hardware.nixosModules.common-pc-laptop
    inputs.hardware.nixosModules.common-pc-laptop-hdd
    inputs.hardware.nixosModules.common-cpu-intel
    inputs.hardware.nixosModules.common-gpu-nvidia-sync
    ./disk-config.nix
    ../components/core
    ../components/optional/hyprland
    ../components/optional/bluetooth.nix
    ../components/optional/home-manager.nix
    ../components/optional/gaming
    ../components/users/grog
  ];

  networking.hostName = "malthor";

  boot.extraModprobeConfig = ''
    install uvcvideo /bin/false
  '';

  hardware.enableRedistributableFirmware = true;
  programs.dconf.enable = true;

  users.users.grog.extraGroups = [
    "gamemode"
  ];

  # NVIDIA Setup
  allowedUnfree = [
    "discord"
    "nvidia-x11"
    "nvidia-settings"
    "nvidia-persistenced"
  ];

  hardware.graphics.enable = true;
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = false;
    nvidiaSettings = true;
    prime = {
      sync.enable = true;
      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";
    };
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };
}
