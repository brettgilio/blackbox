# shell.nix for nix-shell
# Overrideable ghc version by passing `compiler` argument
# Example:
# $ nix-shell shell.nix --argstr compiler ghc822
#
# To list avaliable ghc version:
# $ nix-env -qaPA nixos.haskell.compiler

{ pkgs ? import <nixpkgs> {}
, compiler ? "default"
}:

with pkgs;

let
  haskellPackages = if compiler == "default"
        then pkgs.haskellPackages
        else haskell.packages.${compiler};

  hie_remote = fetchFromGitHub {
      owner = "domenkozar";
      repo = "hie-nix";
      rev = "3568848019da43c4581e931fcb7a6cb8b0f33079";
      sha256 = "00zs610p56l6afbizx2xbhc3wsr5v3fnwiwcs4hzk7myyzl2k4qc";
    };

  hie = with import hie_remote {};
        if lib.versions.majorMinor ghc.version == "8.2"
        then hie82
        else if lib.versions.majorMinor ghc.version == "8.4"
             then hie84
             else hie86;

  ghc = haskellPackages.ghcWithPackages (ps: with ps; [
          extra
        ]);

  hs = [ cabal-install ghc hie ];
in
  mkShell {
    name = "${compiler}-sh";

    buildInputs = [ hs ];

    # shellHook = ''
    #  eval "$(egrep ^export "$(type -p ghc)")"
    #  export PS1="\[\033[1;32m\][$name:\W]\n$ \[\033[0m\]"
    # '';
}
