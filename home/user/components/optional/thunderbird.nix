{ config
, ...
}: {
  programs.thunderbird = {
    enable = true;
    profiles."Main" = {
      isDefault = true;
      withExternalGnupg = true;
      settings = {
        "mail.openpgp.fetch_pubkeys_from_gnupg" = true;
        "mail.openpgp.alias_rules_file" = "file://${config.xdg.configHome}/thunderbird_pgp_aliases.json";
      };
    };
  };

  xdg.configFile."thunderbird_pgp_aliases.json".text = ''
    {
      "rules": [
        {
          "domain": "jaden.rs",
          "keys": [
            {
              "fingerprint": "26A987650243B28802524E2F809FD0D502E2F695"
            }
          ]
        }
      ]
    }
  '';

  accounts.email.accounts."main".thunderbird = {
    enable = true;
    profiles = [ "Main" ];
  };
}
