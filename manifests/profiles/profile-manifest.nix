with import <nixpkgs> {};

let
  profile-packages =
                   [ pkgs.tdesktop
                     pkgs.firefox
                     pkgs.nix
                     pkgs.nix-serve ];

in profile-packages
