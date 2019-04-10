with import <nixpkgs> {};

pkgs.mkShell {
  buildInputs = [ pkgs.rustChannels.nightly.rust
    		  pkgs.rustChannels.nightly.rust-src
		  pkgs.rustChannels.nightly.rust-analysis
    		  pkgs.rls ];


  shellHook = ''
    	      export RUST_SRC_PATH="${pkgs.rustChannels.nightly.rust-src}/lib/rustlib/src/rust/src"
  	      '';
}
