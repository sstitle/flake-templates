{
  description = "Nix flake templates for development environments";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    flake-parts.url = "github:hercules-ci/flake-parts";
    treefmt-nix.url = "github:numtide/treefmt-nix";
  };

  outputs =
    inputs@{ self, flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];

      perSystem =
        {
          config,
          self',
          inputs',
          pkgs,
          system,
          ...
        }:
        let
          treefmtEval = inputs.treefmt-nix.lib.evalModule pkgs ./templates/default/treefmt.nix;
        in
        {
          # for `nix fmt`
          formatter = treefmtEval.config.build.wrapper;

          # for `nix flake check`
          checks = {
            formatting = treefmtEval.config.build.check self;
          };
        };

      # Templates that can be used with 'nix flake init'
      flake.templates = {
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
      };
    };
}
