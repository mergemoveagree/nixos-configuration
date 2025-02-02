{ inputs
, lib
, ...
}: {
  imports = [
    inputs.hardware.nixosModules.raspberry-pi-4
    ./disk-config.nix

    ../components/core
    ./unbound.nix
    ./adguard.nix

    /*
    # TODO: Sort out home-manager configuration stuff
    ../components/users/user
    ../components/users/elmo
    ../components/users/muggles
    */
  ];

  boot.loader.systemd-boot.enable = lib.mkForce false;

  networking.firewall = {
    allowedTCPPorts = [3003 80];
    allowedUDPPorts = [53];
  };

  nixpkgs.hostPlatform.system = "aarch64-linux";

  powerManagement.cpuFreqGovernor = "ondemand";
}
