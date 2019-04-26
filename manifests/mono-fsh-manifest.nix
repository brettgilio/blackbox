{ pkgs ? import <nixpkgs> {} }:

(pkgs.buildFHSUserEnv {
  name = "mono-fsh-manifest";
  targetPkgs = pkgs: (with pkgs;
    [ udev
      alsaLib
      mono
      gmp
    ]) ++ (with pkgs.xorg;
    [ libX11
      libXcursor
      libXrandr
    ]);
  multiPkgs = pkgs: (with pkgs;
    [ udev
      alsaLib
    ]);
  runScript = "bash";
}).env