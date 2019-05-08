(specifications->manifest
 '("emacs-tuareg"
   "ocaml"
   "ocaml-base"
   "ocaml-findlib"
   "ocaml-merlin"
   "ocaml-utop"
   "opam"
   "rsync"
   "mercurial"
   "darcs"
   "make"
   "gcc-toolchain"
   "m4"))

;; Pair "ocaml-manifest.nix" is for LSP. The LSP fails to start
;; so Merlin will be used for completion in the meantime.
