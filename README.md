# Odin Template Project

This is a template project for the [Odin programming language](https://odin-lang.org/). It provides a basic structure for starting new Odin projects, including a `Makefile` for building, running, testing, and creating release builds.

## Features
- Organized source (`src/`) and library (`lib/`) directories
- Libraries added to `lib/` are automatically available in your source code as `lib:<libraryname>` packages
- Simple `Makefile` with targets for:
  - `make release` – Build an optimized release binary
  - `make debug` – Build a debug binary
  - `make run` – Build and run the debug binary
  - `make test` – Run tests in the `tests/` directory
  - `make check` – Run static checks
  - `make clean` – Remove build artifacts
- Example Odin source file in `src/main.odin`
- Pre-configured formatting (`odinfmt.json`) and language server (`ols.json`) settings

## Usage
1. Clone this template and rename `<program>` in the `Makefile` to your desired binary name.
2. Add your code to `src/` and place libraries under `lib/`.
3. Use the provided `make` commands to build, run, and test your project.

## License
This template is provided as-is, without warranty. Modify and use it freely for your Odin projects.
