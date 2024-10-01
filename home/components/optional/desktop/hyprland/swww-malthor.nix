{
  inputs,
  pkgs,
  ...
}:
let
  swww_dir = "${inputs.swww.packages.${pkgs.system}.swww}";
  start_swww_script = pkgs.writeShellScript "start_swww.sh" ''
    ${swww_dir}/bin/swww-daemon
    ${pkgs.coreutils}/bin/sleep 1
    ${swww_dir}/bin/swww img ${../wallpapers/er2.png} -o eDP-1
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

