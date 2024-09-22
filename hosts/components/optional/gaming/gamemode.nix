{
  programs.gamemode.enable = true;
  programs.gamemode.settings = {
    gpu = {
      apply_gpu_optimisations = "accept-responsibility";
      gpu_device = 1;
      amd_performance_level = "auto";
    };
  };
  users.users.user.extraGroups = [
    "gamemode"
  ];
}
