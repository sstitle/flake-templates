# Nix Flake Templates

A collection of Nix flake templates for quickly bootstrapping development environments.

<!-- mdformat-toc start --slug=github --no-anchors --maxlevel=6 --minlevel=1 -->

- [Nix Flake Templates](#nix-flake-templates)
  - [Available Templates](#available-templates)
    - [Default Template](#default-template)
  - [Usage](#usage)
    - [Using the Template](#using-the-template)
    - [Getting Started](#getting-started)
  - [Template Features](#template-features)
    - [Development Shell](#development-shell)
    - [Code Formatting](#code-formatting)
    - [Direnv Integration](#direnv-integration)
  - [Development](#development)
    - [Testing Templates](#testing-templates)
  - [Repository Structure](#repository-structure)
  - [Adding New Templates](#adding-new-templates)
  - [Related Projects](#related-projects)

<!-- mdformat-toc end -->

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
nix flake init -t github:sstitle/flake-templates
```

Or initialize in an existing directory:

```bash
# In your existing project directory
nix flake init -t github:sstitle/flake-templates
```

### Getting Started

Once you've initialized a project with the template:

1. **Enter the development environment:**

   ```bash
   nix develop
   ```

1. **Or use direnv for automatic loading:**

   ```bash
   direnv allow
   ```

1. **View available tasks:**

   ```bash
   mask --help
   ```

1. **Format your code:**

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
- Mask file for convenient scripting

### Code Formatting

Treefmt configuration supporting multiple languages, add to `treefmt.nix` to add more languages.

### Direnv Integration

Automatic environment loading with `.envrc` configuration for seamless development workflow.

## Development

To work on these templates:

```bash
git clone https://github.com/sstitle/flake-templates
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
1. Add your template files
1. Update the main `flake.nix` to include the new template
1. Commit your changes
1. Test the template

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

## Related Projects

- [Nix](https://nixos.org/) - The Nix package manager
- [Nickel](https://nickel-lang.org/) - Configuration language
- [Mask](https://github.com/jacobdeichert/mask) - Task runner
- [Treefmt](https://github.com/numtide/treefmt) - Code formatter
- [Direnv](https://direnv.net/) - Environment management
