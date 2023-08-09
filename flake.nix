{
  description = "website";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.05";
  };

  outputs = { self, nixpkgs, ... }@attrs:
  let
    pname = "website";
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      overlays = [
      ];
    };
    lib = nixpkgs.lib;
  in {
    inherit nixpkgs;

    devShell.${system} = pkgs.mkShell {
      buildInputs = [pkgs.hugo];
    };
  };
}
