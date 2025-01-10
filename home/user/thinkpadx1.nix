{ pkgs
, ...
}: {
  imports = [
    ../components/core
    ../components/optional/desktop
    ../components/optional/office.nix

    ./components/core
    ./components/optional/freetube.nix
    ./components/optional/thunderbird.nix
    ./components/optional/signal-desktop.nix
  ];

  home.packages = with pkgs; [
    vesktop
  ];

  services.easyeffects.preset = "Loudness+Autogain";

  wayland.windowManager.hyprland.plugins = with pkgs.hyprlandPlugins; [
      hyprgrass
  ];

  wayland.windowManager.hyprland.settings = {
    monitor = [
      "eDP-1,1920x1200@60,0x0,1"
    ];
    input.touchpad.clickfinger_behavior = true;
  };

  services.hyprpaper.settings = {
    preload = [
      "${../components/optional/desktop/wallpapers/orv.png}"
    ];
    wallpaper = [
      "eDP-1,${../components/optional/desktop/wallpapers/orv.png}"
    ];
  };
}
