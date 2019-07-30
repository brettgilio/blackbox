{ pkgs ? import <nixpkgs> {}
, compiler ? "default"
}:

with pkgs;

let
  all-hies = import (fetchTarball "https://github.com/infinisil/all-hies/tarball/master") {};

  nixos-1809 = import (builtins.fetchGit {
    url = https://github.com/NixOS/nixpkgs-channels;
    ref = "nixos-18.09";
    rev = "a7e559a5504572008567383c3dc8e142fa7a8633";
  }) {};
  
  hs = [ cabal-install
         nixos-1809.haskell.compiler.ghc862
         gmp
         stack
         haskellPackages.alex
         haskellPackages.happy
         haskellPackages.hoogle
         haskellPackages.cabal-helper ];
  
in
mkShell {
  name = "${compiler}-sh";
  
  buildInputs = [ hs
                  (all-hies.selection { selector = p: { inherit (p)
                    ghc862; }; })
                ];
  
}
