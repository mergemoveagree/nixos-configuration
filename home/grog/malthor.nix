{ pkgs
, ...
}: {
  imports = [
    ../components/core
    ../components/optional/desktop
    ../components/optional/office.nix
  ];

  home.packages = with pkgs; [
    discord
  ];

  services.easyeffects.preset = "Loudness+Autogain";

  wayland.windowManager.hyprland.settings.monitor = [
    "eDP-1,1920x1080@60,0x0,1"
  ];

  services.hyprpaper.settings = {
    preload = [
      "${../components/optional/desktop/wallpapers/er2.png}"
    ];
    wallpaper = [
      "eDP-1,${../components/optional/desktop/wallpapers/er2.png}"
    ];
  };

  wayland.windowManager.hyprland.settings = {
    windowrulev2 = [
      "fullscreen,class:^(gamescope)$"
      "monitor DP-2,class:^(gamescope)$"
      "workspace 10,class:^(gamescope)$"
    ];
    workspace = [ "10,border:false,rounding:false" ];
  };
}
