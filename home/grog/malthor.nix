{ config
, pkgs
, lib
, ...
}: let
  coreutils = pkgs.coreutils;
  check_battery = pkgs.writeShellScript "check_battery" ''
    bat=/sys/class/power_supply/BAT0
    CRIT=''${1:-15}
    FILE=${config.xdg.configHome}/waybar_battery_notify stat=$(${coreutils}/bin/cat $bat/status)
    perc=$(${coreutils}/bin/cat $bat/capacity)

    if [[ $perc -le $CRIT ]] && [[ $stat == "Discharging" ]]; then
      if [[ ! -f "$FILE" ]]; then
        ${pkgs.libnotify}/bin/notify-send --urgency=critical --icon=dialog-warning "Battery Low" "Current charge: $perc%"
        ${coreutils}/bin/touch $FILE
      fi
    elif [[ -f "$FILE" ]]; then
      ${coreutils}/bin/rm $FILE
    fi
  '';
in {
  imports = [
    ../components/core
    ../components/optional/desktop
  ];

  services.easyeffects.preset = "Loudness+Autogain";

  wayland.windowManager.hyprland.settings.monitor = [
    "eDP-1,1920x1080@60,0x0,1"
  ];

  programs.waybar.settings.main.temperature.hwmon-path =
    "/sys/class/thermal/thermal_zone1/temp";

  programs.waybar.settings.main = {
    modules-right = lib.mkForce [ "idle_inhibitor" "pulseaudio" "memory" "temperature" "backlight" "battery" "tray" ];
    backlight = {
      device = "intel_backlight";
      reverse-scrolling = 1;
      format = "{percent}% {icon}";
      format-icons = [ "󱩎" "󱩏" "󱩐" "󱩑" "󱩒" "󱩓" "󱩔" "󱩕" "󱩖" "󰛨" ];
      min-length = 7;
    };
    battery = {
      states = {
        warning = 30;
        critical = 15;
      };
      format = "{capacity}% {icon}";
      format-charging = "{capacity}% 󱐋";
      format-plugged = "{capacity}% ";
      format-alt = "{time} {icon}";
      format-icons = [ "󰂎" "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹" ];
	    on-update = "${check_battery}";
    };
  };

  # TODO: Find better way than copy-and-pasting entire style CSS
  programs.waybar.style = lib.mkForce ''
    * {
        border: none;
        border-radius: 0;
        font-family: MesloLGM Nerd Fonts;
        min-height: 20px;
    }

    window#waybar {
        background: transparent;
    }

    window#waybar.hidden {
        opacity: 0.2;
    }

    #workspaces {
        margin-right: 8px;
        border-radius: 10px;
        transition: none;
        background: #383c4a;
    }

    #workspaces button {
        transition: none;
        color: #7c818c;
        background: transparent;
        padding: 5px;
        font-size: 18px;
    }

    #workspaces button.persistent {
        color: #7c818c;
        font-size: 12px;
    }

    /* https://github.com/Alexays/Waybar/wiki/FAQ#the-workspace-buttons-have-a-strange-hover-effect */
    #workspaces button:hover {
        transition: none;
        box-shadow: inherit;
        text-shadow: inherit;
        border-radius: inherit;
        color: #383c4a;
        background: #7c818c;
    }

    #workspaces button.focused {
        color: white;
    }

    #language {
        padding-left: 16px;
        padding-right: 8px;
        border-radius: 10px 0px 0px 10px;
        transition: none;
        color: #ffffff;
        background: #383c4a;
    }

    #keyboard-state {
        margin-right: 8px;
        padding-right: 16px;
        border-radius: 0px 10px 10px 0px;
        transition: none;
        color: #ffffff;
        background: #383c4a;
    }

    #clock {
        padding-left: 16px;
        padding-right: 16px;
        border-radius: 10px 0px 0px 10px;
        transition: none;
        color: #ffffff;
        background: #383c4a;
    }

    #custom-weather {
        padding-right: 16px;
        border-radius: 0px 10px 10px 0px;
        transition: none;
        color: #ffffff;
        background: #383c4a;
    }

    #idle_inhibitor {
        margin-right: 8px;
    }

    #idle_inhibitor.deactivated {
        padding-left: 16px;
        padding-right: 16px;
        border-radius: 10px 10px 10px 10px;
        transition: none;
        color: #ffffff;
        background: #383c4a;
    }

    #idle_inhibitor.activated {
        padding-left: 16px;
        padding-right: 16px;
        border-radius: 10px 10px 10px 10px;
        transition: none;
        color: #ffffff;
        background: #eb4d4b;
    }

    #pulseaudio {
        margin-right: 8px;
        padding-left: 16px;
        padding-right: 16px;
        border-radius: 10px;
        transition: none;
        color: #ffffff;
        background: #383c4a;
    }

    #pulseaudio.muted {
        background-color: #90b1b1;
        color: #2a5c45;
    }

    #memory {
        margin-right: 8px;
        padding-left: 16px;
        padding-right: 16px;
        border-radius: 10px;
        transition: none;
        color: #ffffff;
        background: #383c4a;
    }

    #temperature {
        margin-right: 8px;
        padding-left: 16px;
        padding-right: 16px;
        border-radius: 10px;
        transition: none;
        color: #ffffff;
        background: #383c4a;
    }

    #temperature.critical {
        background-color: #eb4d4b;
    }

    #backlight {
      margin-right: 8px;
      padding-left: 12px;
      padding-right: 12px;
      border-radius: 10px;
      transition: none;
      color: #ffffff;
      background: #383c4a;
    }

    #battery {
      margin-right: 8px;
      padding-left: 16px;
      padding-right: 16px;
      border-radius: 10px;
      transition: none;
      color: #ffffff;
      background: #383c4a;
    }

    #battery.charging {
      color: #ffffff;
      background-color: #26A65B;
    }

    #battery.warning:not(.charging) {
      background-color: #ffbe61;
      color: black;
    }

    #battery.critical:not(.charging) {
      background-color: #f53c3c;
      color: #ffffff;
      animation-name: blink;
      animation-duration: 0.5s;
      animation-timing-function: linear;
      animation-iteration-count: infinite;
      animation-direction: alternate;
    }

    #tray {
        padding-left: 16px;
        padding-right: 16px;
        border-radius: 10px;
        transition: none;
        color: #ffffff;
        background: #383c4a;
    }

    @keyframes blink {
        to {
            background-color: #ffffff;
            color: #000000;
        }
    }
  '';
}
