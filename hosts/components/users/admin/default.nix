{ config
, ...
}: {
  sops.secrets = {
    "users_passwords/admin" = {
      neededForUsers = true;
      sopsFile = ../secrets.yml;
    };
  };

  users.users.admin = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    hashedPasswordFile = config.sops.secrets."users_passwords/admin".path;
  };
}
