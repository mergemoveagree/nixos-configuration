{ pkgs
, config
, ...
}: let
  coreutils = "${pkgs.coreutils}/bin";
  # Helper script to rebuild as root without git complications
  nixos-rbswitch = pkgs.writeShellScriptBin "nixos-rbswitch" ''
    set -eux
    if [ $(${coreutils}/id -u) -ne 0 ]; then
      echo This script needs to be run as root.
      exit
    fi
    NIXOS_CONFIGURATION=''${1:-${config.users.users.user.home}/nixos-configuration}
    WORKING_DIR=''${2:-/root}
    WORKING_CONFIG="''$WORKING_DIR/nixos-configuration"

    if [ ! -d "$NIXOS_CONFIGURATION" ]; then
      echo $NIXOS_CONFIGURATION does not exist.
      exit 1
    fi

    if [ ! -d "$WORKING_DIR" ]; then
      ${coreutils}/mkdir -p $WORKING_DIR
    fi

    if [ -d "$WORKING_CONFIG" ]; then
      ${coreutils}/rm -rf $WORKING_CONFIG
    fi

    ${coreutils}/cp -r $NIXOS_CONFIGURATION $WORKING_CONFIG
    ${coreutils}/rm -rf $WORKING_CONFIG/.git
    ${pkgs.nixos-rebuild}/bin/nixos-rebuild switch --flake $WORKING_CONFIG#${config.networking.hostName}
    ${coreutils}/rm -rf $WORKING_CONFIG
  '';
in {environment.systemPackages = [ nixos-rbswitch ];}
