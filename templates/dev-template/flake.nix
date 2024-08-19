{ pkgs ? import <nixpkgs> {} }:
{
    description = "Boilerplate nix development flake";

    inputs = {
	nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    };

    outputs = { self, nixpkgs, ... }@inputs:
    let
	system = "x86_64-linux";
	pkgs = nixpkgs.legacyPackages.${system};
    in
    {
	devShells.x86_64-linux.default =
	pkgs.mkShell
	{
	    nativeBuildInputs = with pkgs; [
	    # Development Packages here
	    ];
	};
    };
}
