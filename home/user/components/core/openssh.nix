{
  programs.ssh.enable = true;
  programs.ssh.addKeysToAgent = "yes";
  programs.ssh.matchBlocks = {
    "github.com" = {
      hostname = "github.com";
      identitiesOnly = true;
      identityFile = "/home/user/.ssh/id_github_rw";
    };
    "hf.co" = {
      hostname = "hf.co";
      identitiesOnly = true;
      identityFile = "/home/user/.ssh/id_hf_rw";
    };
  };
}
