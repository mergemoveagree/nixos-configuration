{ config
, lib
, pkgs
, ... }: let
  home_dir = config.home.homeDirectory;
in {
  programs.gpg = {
    enable = true;
    homedir = home_dir + "/.gnupg";
    mutableKeys = true;
    mutableTrust = true;
    publicKeys = [
      {
	source = ./pgp.asc;
	trust = 5;
      }
    ];
  };

  services.gpg-agent = {
    enable = true;
    enableZshIntegration = true;
    enableScDaemon = true;
    pinentryPackage = pkgs.pinentry-qt;
  };
}
