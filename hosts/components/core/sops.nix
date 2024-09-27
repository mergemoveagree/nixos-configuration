{ inputs
, ...
}: {
  imports = [
    inputs.sops-nix.nixosModules.sops
  ];

  home-manager.sharedModules = [
    inputs.sops-nix.homeManagerModules.sops
  ];


  sops = {
    age.sshKeyPaths = [ "/etc/ssh/ssh_host_ed25519_key" ];
  };
}
