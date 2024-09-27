{ config
, ...
}: {
  sops.secrets."users_passwords/elmo" = {
    neededForUsers = true;
    sopsFile = ../secrets.yml;
  };

  users.users.elmo = {
    isNormalUser = true;
    hashedPasswordFile = config.sops.secrets."users_passwords/elmo".path;
  };
}
