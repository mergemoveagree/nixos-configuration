{ lib
, ...
}: {
  allowedUnfree = [
    "steam"
    "steam-original"
    "steam-run"
    "steam-unwrapped"
  ];

  programs.steam = {
    enable = true;
    dedicatedServer.openFirewall = true;
    # remotePlay.openFirewall = true;
    # localNetworkGameTransfers.openFirewall = true;

    gamescopeSession.enable = true;
  };

  # Need to overwrite sysctl for Steam
  boot.kernel.sysctl."kernel.unprivileged_userns_clone" = lib.mkForce 0;
}
