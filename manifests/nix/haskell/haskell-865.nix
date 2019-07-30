{ pkgs ? import <nixpkgs> {}
, compiler ? "default"
}:

with pkgs;

let
  all-hies = import (fetchTarball "https://github.com/infinisil/all-hies/tarball/master") {};
  
  hs = [ cabal-install
         haskell.compiler.ghc865
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
                    ghc865; }; })
                ];
  
}
