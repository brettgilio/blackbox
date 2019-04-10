{ pkgs ? import <nixpkgs> {} }:
  pkgs.mkShell {
    buildInputs = [ pkgs.rustChannels.nightly.rust
    		    pkgs.rls];
}