{
  description = "Nix flake templates for development environments";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    treefmt-nix.url = "github:numtide/treefmt-nix";
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
      treefmt-nix,
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        # Development shell for working on the templates themselves
        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            git
            nixpkgs-fmt
            treefmt
            direnv
            nix-direnv
          ];

          shellHook = ''
            echo "🛠️  Template development environment"
            echo "Use 'nix flake init -t github:yourusername/flake-templates' to test templates"
          '';
        };

        # Formatter for this flake
        formatter = pkgs.nixpkgs-fmt;
      }
    )
    // {
      # Templates that can be used with 'nix flake init'
      templates = {
        default = {
          path = ./templates/default;
          description = "Development environment with nickel, mask, and treefmt";
          welcomeText = ''
            # Welcome to your new Nix development environment!

            This template provides:
            - Nickel configuration language
            - Mask task runner
            - Treefmt code formatter
            - Automatic environment loading with direnv

            Make sure you have "direnv" installed in your NixOS configuration.

            Get started:
            1. Run `direnv allow` (if you have direnv installed)
            3. Run `mask --help` to see available tasks
            4. Run `treefmt` to format your code

            Happy coding! 🚀
          '';
        };

        # You can add more templates here in the future
        # minimal = {
        #   path = ./templates/minimal;
        #   description = "Minimal Nix development environment";
        # };
      };

    };
}
