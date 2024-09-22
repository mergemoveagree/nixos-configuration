{
  imports = [ ./mail.nix ];

  programs.thunderbird = {
    enable = true;
    profiles."Main" = {
      isDefault = true;
      withExternalGnupg = true;
    };
  };
}
