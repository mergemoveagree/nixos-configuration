{ lib
, ...
}: {
  programs.steam = {
    enable = true;
    dedicatedServer.openFirewall = true;
    # remotePlay.openFirewall = true;
    # localNetworkGameTransfers.openFirewall = true;

    gamescopeSession.enable = true;
  };

  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "steam"
    "steam-original"
    "steam-run"
  ];
  # Need to overwrite sysctl for Steam
  boot.kernel.sysctl."kernel.unprivileged_userns_clone" = lib.mkForce 0;
}
