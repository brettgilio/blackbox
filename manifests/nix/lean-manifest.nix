with import <nixpkgs> {};

pkgs.mkShell {
  buildInputs = [ pkgs.lean ];
}
