final: prev: let
  pkgFeatures = {
    "lsp-ai" = [];
    "lsp-ai-llama-cpp" = [ "llama_cpp" ];
  };
  pkgBuilder = pname: buildFeatures: prev.callPackage (callBuilder {inherit pname buildFeatures;}) {};
  packages = prev.lib.mapAttrs pkgBuilder pkgFeatures;
  callBuilder = import ./callBuilder.nix;
in packages
