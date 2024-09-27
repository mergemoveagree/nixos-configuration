{ config
, ...
}: {
  sops.secrets."users_passwords/muggles" = {
    neededForUsers = true;
    sopsFile = ../secrets.yml;
  };

  users.users.muggles = {
    isNormalUser = true;
    hashedPasswordFile = config.sops.secrets."users_passwords/muggles".path;
  };
}
