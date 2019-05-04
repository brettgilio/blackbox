with import <nixpkgs> {};

pkgs.mkShell {
  buildInputs = [ pkgs.tdesktop
  	      	  pkgs.firefox ];
}
