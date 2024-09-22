{ lib
, ...
}:
{
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = lib.mkOptionDefault false;
    pulse.enable = true;
    jack.enable = true;
  };
}
