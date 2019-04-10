with import <nixpkgs> {};

pkgs.mkShell {
  buildInputs = [ pkgs.rustChannels.stable.rust
    		  pkgs.rustChannels.stable.rust-src
		  pkgs.rustChannels.stable.rust-analysis
    		  pkgs.rls ];


  shellHook = ''
    	      export RUST_SRC_PATH="${pkgs.rustChannels.stable.rust-src}/lib/rustlib/src/rust/src"
  	      '';
}
