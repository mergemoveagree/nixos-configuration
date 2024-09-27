{ config
, pkgs
, ...
}: {
  sops.secrets = {
    "users_passwords/user" = {
      neededForUsers = true;
      sopsFile = ../secrets.yml;
    };
    "users_age_keys/user" = {
      owner = config.users.users.user.name;
      inherit (config.users.users.user) group;
      path = "/home/user/.config/sops/age/keys.txt";
      sopsFile = ../secrets.yml;
    };
  };

  programs.zsh.enable = true;

  users.users.user = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "input" ];
    hashedPasswordFile = config.sops.secrets."users_passwords/user".path;
    shell = pkgs.zsh;
  };
}
