{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      ll = "ls -l";
    };
  };
  programs.fzf.enableZshIntegration = true;
  programs.fzf.enableBashIntegration = false;
  programs.thefuck.enableZshIntegration = true;
  programs.thefuck.enableBashIntegration = false;
}
