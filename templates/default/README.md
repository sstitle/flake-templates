# Project Name

A Nix-based development environment with nickel and mask.

## Getting Started

### Prerequisites

- [Nix](https://nixos.org/download.html) with flakes enabled
- (Optional) [direnv](https://direnv.net/) for automatic environment loading

### Quick Start

1. Enter the development shell:
   ```bash
   nix develop
   ```

2. Or if you have direnv installed:
   ```bash
   direnv allow
   ```

### Available Tools

This development environment includes:

- **nickel**: Configuration language for writing maintainable configuration files
- **mask**: Task runner for automating common development tasks
- **treefmt**: Multi-language code formatter
- **git**: Version control
- **direnv/nix-direnv**: Automatic environment loading

### Task Automation

This project uses [mask](https://github.com/jacobdeichert/mask) for task automation. View available tasks:

```bash
mask --help
```

Common tasks:
- `mask dev` - Start development environment
- `mask build` - Build the project
- `mask format` - Format all code
- `mask check` - Run all checks
- `mask clean` - Clean build artifacts
- `mask update` - Update dependencies

### Code Formatting

Format your code with treefmt:

```bash
# Format all files
treefmt

# Check formatting without making changes
treefmt --fail-on-change
```

You can also use the nix formatter:

```bash
nix fmt
```

### Development

1. Make your changes
2. Format code: `mask format`
3. Run checks: `mask check`
4. Commit your changes

### Project Structure

```
.
├── flake.nix          # Nix flake configuration
├── treefmt.nix        # Formatter configuration
├── maskfile.md        # Task definitions
├── .envrc             # direnv configuration
└── README.md          # This file
```

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Ensure all checks pass with `mask check`
5. Submit a pull request

## License

[Add your license here]