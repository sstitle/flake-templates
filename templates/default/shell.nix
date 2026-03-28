{ pkgs, ... }:
pkgs.mkShell {
  buildInputs = with pkgs; [
    # Core tools
    git
    nickel
    mask
  ];

  shellHook = ''
    echo "🚀 Development environment loaded!"
    echo "Available tools:"
    echo "  - nickel: Configuration language"
    echo "  - mask: Task runner"
    echo ""
    echo "Run 'mask --help' to see available tasks."
    echo "Run 'nix fmt' to format all files."
  '';
}
