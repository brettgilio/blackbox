with import <nixpkgs> {};

let
  mozilla-overlay = import (builtins.fetchGit { url = https://github.com/mozilla/nixpkgs-mozilla.git; ref = "master";});
  nixpkgs-master = import (builtins.fetchGit { url = https://github.com/NixOS/nixpkgs.git; ref = "master";})  { overlays = [ mozilla-overlay ]; };
  
  rustStable = nixpkgs-master.rustChannelOf {
    channel = "1.34.0";
  };
  
in
with nixpkgs-master;
stdenv.mkDerivation {
  name = "rust-stable";
  buildInputs = [
    rustStable.rust
  ];
  
  
  shellHook = ''
              export RUST_SRC_PATH="${rustStable.rust-src}/lib/rustlib/src/rust/src"
              '';
}
