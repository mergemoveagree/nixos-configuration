{ pkgs ? import <nixpkgs> {}
, ...
}: {
  default = pkgs.mkShell {
    NIX_CONFIG = "extra-experimental-features = nix-command flakes";
    nativeBuildInputs = with pkgs; [
      git
      git-crypt
      sops
      gnupg
      age
      ssh-to-age
      pcsclite
      ccid
    ];
  };
}
