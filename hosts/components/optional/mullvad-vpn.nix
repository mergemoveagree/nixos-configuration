{ pkgs
, ...
}: {
  services.mullvad-vpn = {
    enable = true;
    package = pkgs.mullvad-vpn;
    enableExcludeWrapper = true;
  };

  sops.secrets.mullvad_account_number = {
    path = "/etc/mullvad-vpn/account-history.json";
    sopsFile = ../secrets.yml;
  };
}
