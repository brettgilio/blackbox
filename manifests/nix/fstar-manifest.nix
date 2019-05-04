with import <nixpkgs> {};

pkgs.mkShell {
  buildInputs = [ pkgs.fstar ];
}
