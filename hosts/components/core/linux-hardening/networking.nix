{ pkgs
, lib
, ...
}: {
  environment.etc.machine-id.text = "b08dfa6083e7567a1921a715000001fb";

  # TODO: Abstract interface name
  systemd.services.macchanger = {
    enable = true;
    description = "macchanger on wlan0";
    wants = [ "network-pre.target" ];
    before = [ "network-pre.target" ];
    bindsTo = [ "sys-subsystem-net-devices-wlan0.device" ];
    after = [ "sys-subsystem-net-devices-wlan0.device" ];
    wantedBy = [ "multi-user.target" ];
    restartIfChanged = false;
    serviceConfig = {
      Type = "oneshot";
      ExecStart = "${pkgs.macchanger}/bin/macchanger -e wlan0";
      RemainAfterExit = true;
    };
  };

  networking.networkmanager.connectionConfig = {
    "ipv6.ip6-privacy" = 2;
  };

  boot.kernel.sysctl."net.ipv4.tcp_syncookies" = 1;
  boot.kernel.sysctl."net.ipv4.tcp_rfc1337" = 1;
  boot.kernel.sysctl."net.ipv4.conf.all.rp_filter" = 1;
  boot.kernel.sysctl."net.ipv4.conf.default.rp_filter" = 1;
  boot.kernel.sysctl."net.ipv4.conf.all.accept_redirects" = 0;
  boot.kernel.sysctl."net.ipv4.conf.default.accept_redirects" = 0;
  boot.kernel.sysctl."net.ipv4.conf.all.secure_redirects" = 0;
  boot.kernel.sysctl."net.ipv4.conf.default.secure_redirects" = 0;
  boot.kernel.sysctl."net.ipv6.conf.all.accept_redirects" = 0;
  boot.kernel.sysctl."net.ipv6.conf.default.accept_redirects" = 0;
  boot.kernel.sysctl."net.ipv4.conf.all.send_redirects" = 0;
  boot.kernel.sysctl."net.ipv4.conf.default.send_redirects" = 0;
  boot.kernel.sysctl."net.ipv4.tcp_fin_timeout" = 30;
  boot.kernel.sysctl."net.ipv4.icmp_echo_ignore_all" = 1;
  boot.kernel.sysctl."net.ipv4.conf.all.accept_source_route" = 0;
  boot.kernel.sysctl."net.ipv4.conf.default.accept_source_route" = 0;
  boot.kernel.sysctl."net.ipv6.conf.all.accept_source_route" = 0;
  boot.kernel.sysctl."net.ipv6.conf.default.accept_source_route" = 0;
  boot.kernel.sysctl."net.ipv6.conf.all.accept_ra" = 0;
  boot.kernel.sysctl."net.ipv6.conf.default.accept_ra" = 0;
  boot.kernel.sysctl."net.ipv4.tcp_sack" = 0;
  boot.kernel.sysctl."net.ipv4.tcp_dsack" = 0;
  boot.kernel.sysctl."net.ipv4.tcp_fack" = 0;
  boot.kernel.sysctl."net.ipv6.conf.all.use_tempaddr" = 2;
  boot.kernel.sysctl."net.ipv6.conf.default.use_tempaddr" = lib.mkForce 2;
  boot.kernel.sysctl."net.ipv4.ip_forward" = 0;
  boot.kernel.sysctl."net.ipv4.tcp_keepalive_time" = 180;
  boot.kernel.sysctl."net.ipv4.tcp_keepalive_intvl" = 10;
  boot.kernel.sysctl."net.ipv4.tcp_keepalive_probes" = 3;
}
