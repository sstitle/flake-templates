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
        treefmtEval = treefmt-nix.lib.evalModule pkgs ./templates/default/treefmt.nix;
      in
      {

        # for `nix fmt`
        formatter = treefmtEval.config.build.wrapper;

        # for `nix flake check`
        checks = {
          formatting = treefmtEval.config.build.check self;
        };
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
            2. Run `nix fmt` to format your code
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
