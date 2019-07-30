{ pkgs ? import <nixpkgs> {}
, compiler ? "default"
}:

with pkgs;

let
  all-hies = import (fetchTarball "https://github.com/infinisil/all-hies/tarball/master") {};
  
  hs = [ haskell.compiler.ghc864
         haskell.compiler.ghc863
         haskell.compiler.ghc862
         haskell.compiler.ghc861
         haskell.compiler.ghc844
         haskell.compiler.ghc843
         haskell.compiler.ghc842
         haskell.compiler.ghc822 ];
  
in
mkShell {
  name = "${compiler}-sh";
  
  buildInputs = [ hs
                  (all-hies.selection { selector = p: { inherit (p)
                    ghc865
                    ghc864
                    ghc863
                    ghc862
                    ghc861
                    ghc844
                    ghc843
                    ghc842
                    ghc822; }; })
                ];
  
}
