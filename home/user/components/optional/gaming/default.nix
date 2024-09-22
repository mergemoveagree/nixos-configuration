{ pkgs
, ...
}: {
  home.packages = with pkgs; [
    prismlauncher
    openrgb  # TODO: Move somewhere that makes sense
  ];
}
