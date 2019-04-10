{ pkgs ? import <nixpkgs> {} }:
  pkgs.mkShell {
    buildInputs = [ pkgs.rustChannels.stable.rust
    		    pkgs.rls];
}