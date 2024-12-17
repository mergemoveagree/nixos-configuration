{ lib
, ...
}: {
  imports = [
    ./steam.nix
    ./gamemode.nix
  ];

  hardware.xone.enable = true;
  allowedUnfree = [
    "xow_dongle-firmware"
  ];

  hardware.graphics.enable32Bit = true;
  services.pipewire.alsa.support32Bit = lib.mkForce true;
}
