{ pkgs ? import <nixpkgs> {} }:

(pkgs.buildFHSUserEnv {
  name = "dotnet-fsh-manifest";
  targetPkgs = pkgs: (with pkgs;
    [ udev
      alsaLib
      dotnet-sdk
      mono
      gmp
      wget
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