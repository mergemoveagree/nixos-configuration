{
  imports = [
    ./components/core

    ./components/optional/desktop
    ./components/optional/freetube.nix
  ];

  wayland.windowManager.hyprland.settings.monitor = [
    "eDP-1,1920x1200@60,0x0,1"
  ];

  programs.waybar.settings.main.temperature.hwmon-path =
    "/sys/devices/platform/coretemp.0/hwmon/hwmon4/temp4_input";
}
