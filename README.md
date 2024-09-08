# Dashboard Generator Vizro

Dashboard Generator Vizro is a CLI tool for launching a Vizro Dashboard. This tool is designed to streamline the process of generating and launching dashboards, making it easy to visualize your data.

## Features

- Launch Vizro Dashboards with a simple CLI command.
- Manage dependencies with pip.
- Use pre-commit and commitizen for standardized commits.
- Compile every recurrent commands in a Makefile.

## Installation

1. Clone the repository:

    ```bash
    git clone https://github.com/Sonson6/dashboard-generator.git
    cd dashboard-generator
    ```

2. Create a virtual environment and install the dependencies:

    ```bash
    make install
    ```

Be careful, on Windows you might need to modify the Makefile so you use `venv\Scripts\activate` or `venv\Scripts\pip`.

Moreover, note that make install will install dependencies but not activate the venv itself, so if you need it make sure to activate it with the right command (again, `venv\Scripts\activate` on Windows or `. venv/bin/activate` on MacOS/Linux).

## Usage

To launch the Vizro Dashboard, simply run the CLI command:

```bash
make run
```

This will start the dashboard with default settings on `http://127.0.0.1:8050/`. You can open it on a browser, typing `localhost:8050`.

## Development


### Pre-commit Hooks

Pre-commit hooks are used to ensure code quality and consistency. They are automatically run on every commit. You can also run them manually:

```bash
make pre-commit-checks
```

Make sure you run it before commiting anything because pre-commit hooks run as a "validation" of each commits. So if your pre-commits don't pass, commit won't pass either.


### Committing Changes

This project uses `commitizen` for standardized commit messages. To make a commit, use:

```bash
make commit
```

This will guide you through the process of creating a standardized commit message.


### Clean working environment

To remove caches created by dependencies or the virtual environment itself, run the following command :

```bash
make clean
```

## Contributing

Contributions are welcome! Please open an issue or submit a pull request.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
