{
  programs.ssh.enable = true;
  programs.ssh.addKeysToAgent = "yes";
  programs.ssh.matchBlocks = {
    "github.com" = {
      hostname = "github.com";
      identitiesOnly = true;
      identityFile = "/home/user/.ssh/id_github_rw";
    };
  };
}
