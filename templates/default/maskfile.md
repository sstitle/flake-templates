# Maskfile

This is a [mask](https://github.com/jacobdeichert/mask) task runner file.

## dev

> Start development environment

```bash
echo "Starting development environment..."
nix develop
```

## build

> Build the project

```bash
echo "Building project..."
# Add your build commands here
```

## format

> Format all code using treefmt

```bash
treefmt
```

## check

> Run all checks including formatting

```bash
echo "Running formatting check..."
treefmt --fail-on-change

echo "Running other checks..."
nix flake check
```

## clean

> Clean build artifacts and caches

```bash
echo "Cleaning up..."
rm -rf result result-*
nix-collect-garbage
```

## update

> Update flake inputs

```bash
echo "Updating flake inputs..."
nix flake update
```

## shell

> Enter nix development shell

```bash
nix develop
```
