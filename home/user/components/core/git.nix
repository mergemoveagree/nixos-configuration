{
  programs.git = {
    enable = true;
    userEmail = "180627245+mergemoveagree@users.noreply.github.com";
    userName = "Jaden Nola";
    extraConfig = {
      commit.gpgsign = true;
      gpg.format = "ssh";
      user.signingkey = "/home/user/.ssh/id_github_sign";
    };
  };
}
