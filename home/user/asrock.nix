{ pkgs
, ...
}: {
  imports = [
    ../components/core
    ../components/optional/desktop
    ../components/optional/gaming
    ../components/optional/office.nix

    ./components/core
    ./components/optional/freetube.nix
    ./components/optional/thunderbird.nix
    ./components/optional/signal-desktop.nix
  ];

  home.packages = with pkgs; [
    vesktop
  ];

  wayland.windowManager.hyprland.settings.monitor = [
    "DP-1,3440x1440@160,0x0,1"
    "DP-2,1920x1080@144,-1920x360,1"
  ];

  programs.waybar.settings.main.temperature.hwmon-path =
    "/sys/devices/platform/coretemp.0/hwmon/hwmon3/temp1_input";

  services.hyprpaper.settings = {
    preload = [
      "${../components/optional/desktop/wallpapers/rags.jpg}"
      "${../components/optional/desktop/wallpapers/sl.jpg}"
    ];
    wallpaper = [
      "DP-2,${../components/optional/desktop/wallpapers/rags.jpg}"
      "DP-1,${../components/optional/desktop/wallpapers/sl.jpg}"
    ];
  };

  wayland.windowManager.hyprland.settings = {
    windowrulev2 = [
      "fullscreen,class:^(gamescope)$"
      "monitor DP-1,class:^(gamescope)$"
      "workspace 10,class:^(gamescope)$"
    ];
    workspace = [ "10,border:false,rounding:false" ];
  };

  services.easyeffects.preset = "Perfect EQ";
}
