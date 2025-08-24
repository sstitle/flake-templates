{
  description = "Development environment with nickel and mask";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    treefmt-nix.url = "github:numtide/treefmt-nix";
  };

  outputs = { self, nixpkgs, flake-utils, treefmt-nix }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        treefmtEval = treefmt-nix.lib.evalModule pkgs ./treefmt.nix;
      in
      {
        # Development shell with nickel and mask
        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            # Core tools
            nickel
            mask

            # Additional useful tools
            git
            direnv
            nix-direnv

            # Formatting
            treefmtEval.config.build.wrapper
          ];

          shellHook = ''
            echo "🚀 Development environment loaded!"
            echo "Available tools:"
            echo "  - nickel: Configuration language"
            echo "  - mask: Task runner"
            echo "  - treefmt: Code formatter"
            echo ""
            echo "Run 'mask --help' to see available tasks"
            echo "Run 'treefmt' to format all files"
          '';
        };

        # Formatter
        formatter = treefmtEval.config.build.wrapper;

        # Make treefmt available as a package
        packages.treefmt = treefmtEval.config.build.wrapper;
        packages.default = treefmtEval.config.build.wrapper;

        # Checks
        checks = {
          formatting = treefmtEval.config.build.check self;
        };
      }
    );
}