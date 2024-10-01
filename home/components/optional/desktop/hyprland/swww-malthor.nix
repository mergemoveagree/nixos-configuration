{
  inputs,
  pkgs,
  ...
}:
let
  start_swww_script = pkgs.writeShellScript "start_swww.sh" ''
    swww-daemon
    sleep 1
    swww img ${../wallpapers/er2.png} -o eDP-1
  '';
in
{
  home.packages = with inputs; [
    swww.packages.${pkgs.system}.swww
  ];

  wayland.windowManager.hyprland.settings.exec-once = [
    "${start_swww_script}"
  ];
}

