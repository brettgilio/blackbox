with import <nixpkgs> {};

pkgs.mkShell {
  buildInputs = [ pkgs.fsharp41
  	      	  pkgs.mono
		  pkgs.dotnet-sdk ];
}
