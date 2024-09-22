{ config
, ...
}: let
  home_dir = config.home.homeDirectory;
in {
  sops = {
    age.keyFile = "${home_dir}/.config/sops/age/keys.txt";

    secrets = {
      ssh_github_private_key = {
        path = "${home_dir}/.ssh/id_github_rw";
	sopsFile = ../secrets.yml;
      };
      ssh_signing_private_key = {
        path = "${home_dir}/.ssh/id_github_sign";
	sopsFile = ../secrets.yml;
      };
    };
  };
}
