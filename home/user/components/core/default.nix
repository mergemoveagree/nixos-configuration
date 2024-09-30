{ pkgs
, lib
, ...
}: {
  imports = [
    ./git.nix
    ./gpg.nix
    ./openssh.nix
    ./sops.nix
    ./zsh.nix
    ./nixvim
    ./mail.nix
  ];

  home.packages = with pkgs; [
    tor-browser
  ];

  programs.fzf.enable = true;
  programs.fzf.enableBashIntegration = lib.mkDefault true;

  programs.thefuck.enable = true;
  programs.thefuck.enableBashIntegration = lib.mkDefault true;
}
