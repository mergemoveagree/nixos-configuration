{ lib
, rustPlatform
, fetchFromGitHub
, pkg-config
, oniguruma
, openssl
, sqlite
, stdenv
, darwin
}: rustPlatform.buildRustPackage rec {
  pname = "lsp-ai";
  version = "0.7.0";

  src = fetchFromGitHub {
    owner = "SilasMarvin";
    repo = "lsp-ai";
    rev = "v${version}";
    hash = "sha256-DwqqZBzLevuRCW6QzGyWdE+JtpW6b3EMDuiWtajv/U4=";
  };

  cargoLock = {
    lockFile = ./Cargo.lock;
    outputHashes = {
      "hf-hub-0.3.2" = "sha256-1AcishEVkTzO3bU0/cVBI2hiCFoQrrPduQ1diMHuEwo=";
      "tree-sitter-zig-0.0.1" = "sha256-UXJCh8GvXzn+sssTrIsLViXD3TiBZhLFABYCKM+fNMQ=";
    };
  };

  # Unable to run tests without a local model
  doCheck = false;

  nativeBuildInputs = [
    pkg-config
    rustPlatform.bindgenHook
  ];

  buildInputs = [
    oniguruma
    openssl
    sqlite
  ] ++ lib.optionals stdenv.isDarwin [
    darwin.apple_sdk.frameworks.CoreFoundation
    darwin.apple_sdk.frameworks.Security
    darwin.apple_sdk.frameworks.SystemConfiguration
  ];

  env = {
    OPENSSL_NO_VENDOR = true;
    RUSTONIG_SYSTEM_LIBONIG = true;
  };

  meta = {
    description = "LSP-AI is an open-source language server that serves as a backend for AI-powered functionality, designed to assist and empower software engineers, not replace them";
    homepage = "https://github.com/SilasMarvin/lsp-ai";
    license = lib.licenses.mit;
    maintainers = [];
    mainProgram = "lsp-ai";
  };
}
