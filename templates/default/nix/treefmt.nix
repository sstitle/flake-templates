{ pkgs, ... }:
{
  # Used to find the project root
  projectRootFile = "flake.nix";

  programs = {
    # Nix formatter
    nixpkgs-fmt.enable = true;
    
    # Markdown formatter
    mdformat.enable = true;
    
    # YAML formatter
    yamlfmt.enable = true;
    
    # JSON formatter
    jsonfmt.enable = true;
    
    # Shell script formatter
    shfmt = {
      enable = true;
      indent_size = 2;
    };
    
    # Nickel formatter (if available)
    # Note: This might need to be updated when nickel formatter becomes available
  };

  settings = {
    global.excludes = [
      "*.lock"
      ".direnv/**"
      "result*"
      ".git/**"
    ];
  };
}