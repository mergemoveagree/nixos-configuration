{ config
, ...
}: {
  sops.secrets = {
    "users_passwords/grog" = {
      neededForUsers = true;
      sopsFile = ../secrets.yml;
    };
  };

  users.users.grog = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "input" ];
    hashedPasswordFile = config.sops.secrets."users_passwords/grog".path;
  };

  home-manager.users.grog = import ../../../../home/grog/${config.networking.hostName}.nix;
}
