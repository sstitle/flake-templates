# Nix Flake Templates

A collection of Nix flake templates for quickly bootstrapping development environments.

## Available Templates

### Default Template
A comprehensive development environment featuring:
- **Nickel**: Configuration language for maintainable configs
- **Mask**: Task runner for automating development workflows
- **Treefmt**: Multi-language code formatter
- **Direnv**: Automatic environment loading
- Additional development tools (git, nix-direnv)

## Usage

### Using the Template

Create a new project with the default template:

```bash
# Create a new directory and initialize with the template
mkdir my-new-project
cd my-new-project
nix flake init -t github:yourusername/flake-templates
```

Or initialize in an existing directory:

```bash
# In your existing project directory
nix flake init -t github:yourusername/flake-templates
```

### Getting Started

Once you've initialized a project with the template:

1. **Enter the development environment:**
   ```bash
   nix develop
   ```

2. **Or use direnv for automatic loading:**
   ```bash
   direnv allow
   ```

3. **View available tasks:**
   ```bash
   mask --help
   ```

4. **Format your code:**
   ```bash
   treefmt
   # or
   nix fmt
   ```

## Template Features

### Development Shell
The template includes a comprehensive development shell with:
- Nickel configuration language
- Mask task runner
- Treefmt formatter
- Git and direnv tools
- Helpful shell hook with usage information

### Task Automation
Pre-configured mask tasks for common operations:
- `mask dev` - Start development environment
- `mask build` - Build the project
- `mask format` - Format all code
- `mask check` - Run all checks
- `mask clean` - Clean build artifacts
- `mask update` - Update dependencies

### Code Formatting
Treefmt configuration supporting multiple languages:
- Nix (nixpkgs-fmt)
- Markdown (mdformat)
- YAML (yamlfmt)
- JSON (jsonfmt)
- Shell scripts (shfmt)

### Direnv Integration
Automatic environment loading with `.envrc` configuration for seamless development workflow.

## Development

To work on these templates:

```bash
git clone https://github.com/yourusername/flake-templates
cd flake-templates
nix develop
```

### Testing Templates

To test a template locally:

```bash
# In a temporary directory
mkdir /tmp/test-template
cd /tmp/test-template
nix flake init -t /path/to/flake-templates
nix develop
```

## Repository Structure

```
.
├── flake.nix              # Main flake with template definitions
├── flake.lock             # Lock file with pinned dependencies
├── templates/             # Template definitions
│   └── default/           # Default template files
│       ├── flake.nix      # Template flake configuration
│       ├── treefmt.nix    # Formatter configuration
│       ├── maskfile.md    # Task definitions
│       ├── .envrc         # Direnv configuration
│       └── README.md      # Template documentation
└── README.md              # This file
```

## Adding New Templates

1. Create a new directory under `templates/`
2. Add your template files
3. Update the main `flake.nix` to include the new template
4. Commit your changes
5. Test the template

Example:
```nix
templates = {
  default = { /* existing template */ };
  
  my-new-template = {
    path = ./templates/my-new-template;
    description = "My custom development environment";
  };
};
```

## Contributing

1. Fork the repository
2. Create a feature branch
3. Add your template or improvements
4. Test thoroughly
5. Submit a pull request

## License

[Add your license here]

## Related Projects

- [Nix](https://nixos.org/) - The Nix package manager
- [Nickel](https://nickel-lang.org/) - Configuration language
- [Mask](https://github.com/jacobdeichert/mask) - Task runner
- [Treefmt](https://github.com/numtide/treefmt) - Code formatter
- [Direnv](https://direnv.net/) - Environment management