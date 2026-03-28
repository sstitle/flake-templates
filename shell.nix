{ pkgs, ... }:
pkgs.mkShell {
  buildInputs = with pkgs; [
    git
    nixfmt-rfc-style
  ];
}
