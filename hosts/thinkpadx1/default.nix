{ pkgs
, inputs
, ...
}:
{
  imports = [
    inputs.hardware.nixosModules.lenovo-thinkpad-x1-9th-gen
    inputs.hardware.nixosModules.common-pc-laptop
    inputs.hardware.nixosModules.common-cpu-intel
    ./hardware-configuration.nix

    ./disk-config.nix
    ../components/optional/home-manager.nix

    ../components/core

    ../components/optional/mullvad-vpn.nix
    ../components/optional/hyprland
    ../components/optional/bluetooth.nix

    ../components/users/user
  ];

  networking.hostName = "thinkpadx1";

  programs.dconf.enable = true;

  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      intel-media-driver
      libvdpau-va-gl
    ];
  };

  hardware.firmware = [pkgs.sof-firmware];

  environment.sessionVariables = {
    LIBVA_DRIVER_NAME = "iHD";
  };
}
