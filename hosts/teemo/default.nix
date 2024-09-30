{ inputs
, lib
, ...
}: {
  imports = [
    inputs.hardware.nixosModules.raspberry-pi-4
    ./disk-config.nix

    ../components/core

    ../components/users/user
    ../components/users/elmo
    ../components/users/muggles
  ];

  boot.loader.systemd-boot.enable = lib.mkForce false;

  nixpkgs.hostPlatform.system = "aarch64-linux";

  powerManagement.cpuFreqGovernor = "ondemand";
}