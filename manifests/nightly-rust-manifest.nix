# Thank you @Laalf

with import <nixpkgs> {};

let
  mozilla-overlay = import (builtins.fetchGit { url = https://github.com/mozilla/nixpkgs-mozilla.git; ref = "master";});
  nixpkgs-master = import (builtins.fetchGit { url = https://github.com/NixOS/nixpkgs.git; ref = "master";})  { overlays = [ mozilla-overlay ]; };
  
in
  with nixpkgs-master;
  stdenv.mkDerivation {
      name = "nix_is_painful";
      buildInputs = [
          pkgs.rustChannels.nightly.rust
          pkgs.rustChannels.nightly.rust-src
          pkgs.rustChannels.nightly.rust-analysis
          pkgs.rls
    ];


  shellHook = ''
              export RUST_SRC_PATH="${pkgs.rustChannels.nightly.rust-src}/lib/rustlib/src/rust/src"
              '';
}
