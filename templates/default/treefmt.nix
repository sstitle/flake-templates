{ ... }:
{
  # Used to find the project root
  projectRootFile = "flake.nix";
  programs = {
    nixpkgs-fmt.enable = true;
    mdformat.enable = true;
  };
}
