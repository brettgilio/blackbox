{ pkgs ? import <nixpkgs> {} }:
  pkgs.mkShell {
    buildInputs = [ pkgs.rustChannels.stable.rust
    		    pkgs.rustChannels.stable.rust-src
		    pkgs.rustChannels.stable.rust-analysis
    		    pkgs.rls ];
}
