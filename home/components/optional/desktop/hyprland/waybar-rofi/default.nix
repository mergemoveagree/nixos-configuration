{ pkgs
, ... 
}: let
  mechabar = pkgs.applyPatches {
    src = pkgs.fetchFromGitHub {
      owner = "sejjy";
      repo = "mechabar";
      rev = "dc155ad140d2deac9fddc0b1e963bd6186852319";
      hash = "sha256-F+lGcUq4Uv9VXXcYkXtOViy5fneolRuvXFN+Zj25YMg=";
    };
    patches = [ ./0001-Patch-waybar-modules-for-me.patch ];
  };
in {
  home.packages = with pkgs; [
    bluetui
    bluez
    brightnessctl
    nerd-fonts.jetbrains-mono
    lm_sensors
    (python3.withPackages (ps: [ ps.pygobject3 ]))
  ];

  # NOTE: I'm lazy
  programs.waybar.enable = true;
  xdg.configFile."waybar/config.jsonc".source = "${mechabar}/config.jsonc";
  xdg.configFile."waybar/style.css".source = "${mechabar}/style.css";
  xdg.configFile."waybar/theme.css".source = "${mechabar}/theme.css";
  xdg.configFile."waybar/scripts".source = "${mechabar}/scripts";

  programs.rofi = {
    enable = true;
    terminal = "${pkgs.kitty}/bin/kitty";
    package = pkgs.rofi-wayland;
  };
  xdg.configFile.rofi = {
    source = "${mechabar}/rofi";
    recursive = true;
  };
}
