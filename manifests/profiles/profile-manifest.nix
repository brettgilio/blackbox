with import <nixpkgs> {};

let
  profile-packages =
                   [ pkgs.tdesktop
                     pkgs.firefox
                     pkgs.nix ];

in profile-packages
