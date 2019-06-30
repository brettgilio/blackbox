{ pkgs ? import <nixpkgs> {}
, compiler ? "default"
}:

with pkgs;

let
  all-hies = import (fetchTarball "https://github.com/infinisil/all-hies/tarball/master") {};

  hs = [ cabal-install
         ghc
         gmp
         stack
         haskellPackages.alex
         haskellPackages.happy ];
in
  mkShell {
    name = "${compiler}-sh";

    buildInputs = [ hs
                    (all-hies.selection { selector = p: { inherit (p) ghc864 ghc863 ghc843; }; })
                  ];
    
    # shellHook = ''
    #  eval "$(egrep ^export "$(type -p ghc)")"
    #  export PS1="\[\033[1;32m\][$name:\W]\n$ \[\033[0m\]"
    # '';
}
