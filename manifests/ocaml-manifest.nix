with import <nixpkgs> {};

pkgs.mkShell {
  buildInputs = [ nodePackages.ocaml-language-server ];
}