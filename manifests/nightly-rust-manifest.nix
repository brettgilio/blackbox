{ pkgs ? import <nixpkgs> {} }:
  pkgs.mkShell {
    buildInputs = [ pkgs.rustChannels.nightly.rust
    		    pkgs.rustChannels.nightly.rust-src
		    pkgs.rustChannels.nightly.rust-analysis
    		    pkgs.rls ];
}