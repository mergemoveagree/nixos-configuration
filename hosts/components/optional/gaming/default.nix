{ lib
, ...
}: {
  imports = [
    ./steam.nix
    ./gamemode.nix
  ];

  hardware.graphics.enable32Bit = true;
  services.pipewire.alsa.support32Bit = lib.mkForce true;
}
