{
  programs.thunderbird = {
    enable = true;
    profiles."Main" = {
      isDefault = true;
      withExternalGnupg = true;
    };
  };

  accounts.email.accounts."main".thunderbird = {
    enable = true;
    profiles = [ "Main" ];
  };
}
