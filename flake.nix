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

    mkdocsInputs = with pkgs; [
      mkdocs
      python3Packages.mkdocs-material
    ];

    mkdocsConfig = pkgs.writeText "mkdocs.json" (builtins.toJSON ({
      docs_dir = ./docs;
    } // (builtins.fromJSON (builtins.readFile ./mkdocs.json))));
  in {
    inherit nixpkgs;

    defaultPackage.${system} = pkgs.runCommandNoCC "website-siteroot" { nativeBuildInputs = mkdocsInputs; } ''
      mkdocs build -sf ${mkdocsConfig} -d $out
    '';

    devShell.${system} = pkgs.mkShell {
      buildInputs = mkdocsInputs;
    };
  };
}
