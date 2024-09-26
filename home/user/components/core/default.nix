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
  ];

  home.packages = with pkgs; [
    wl-clipboard-rs
    tor-browser
  ];

  programs.fzf.enable = true;
  programs.fzf.enableBashIntegration = lib.mkDefault true;

  programs.thefuck.enable = true;
  programs.thefuck.enableBashIntegration = lib.mkDefault true;
  
  programs.home-manager.enable = true;
  home.stateVersion = "24.05";
}
