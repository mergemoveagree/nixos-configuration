{
  imports = [
    ./components/core

    ./components/optional/desktop
    ./components/optional/gaming
    ./components/optional/freetube.nix
  ];

  wayland.windowManager.hyprland.settings.monitor = [
    # Don't ask about the positioning
    "DP-2,2560x1440@144,-1920x150,1"
    "HDMI-A-1,1920x1080@60,0x0,1.33333"
  ];

  programs.waybar.settings.main.temperature.hwmon-path =
    "/sys/devices/platform/coretemp.0/hwmon/hwmon3/temp1_input";

  wayland.windowManager.hyprland.settings = {
    windowrulev2 = [
      "fullscreen,class:^(gamescope)$"
      "monitor DP-2,class:^(gamescope)$"
      "workspace 10,class:^(gamescope)$"
    ];
    workspace = [ "10,border:false,rounding:false" ];
  };
}
