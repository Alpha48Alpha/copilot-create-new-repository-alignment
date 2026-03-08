# copilot-create-new-repository-alignment

A repository alignment project that provides standards, templates, and best practices for creating new repositories.

## Overview

This project establishes a consistent structure and set of conventions to follow when creating new repositories. It ensures all repositories are properly aligned with organizational standards and best practices.

## Getting Started

### Prerequisites

- Git ≥ 2.x installed on your machine
- A GitHub account

### Quick Setup (Automated)

The fastest way to get started is to run the included setup script, which
verifies prerequisites, applies recommended Git settings, and fetches the
latest changes:

```bash
git clone https://github.com/Alpha48Alpha/copilot-create-new-repository-alignment.git
cd copilot-create-new-repository-alignment
bash scripts/setup.sh
```

Or, if you have `make` available:

```bash
make setup
```

### GitHub Codespaces / VS Code Dev Containers

This repository ships with a pre-configured [dev container](.devcontainer/devcontainer.json).
Open the repository in GitHub Codespaces or with the VS Code
**Dev Containers** extension and the environment will be configured
automatically—no manual steps required.

### Manual Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/Alpha48Alpha/copilot-create-new-repository-alignment.git
   cd copilot-create-new-repository-alignment
   ```

2. Configure Git (if not already done):

   ```bash
   git config --global user.name  "Your Name"
   git config --global user.email "you@example.com"
   ```

3. Review the contributing guidelines in [CONTRIBUTING.md](CONTRIBUTING.md).

## Repository Structure

```
copilot-create-new-repository-alignment/
├── .devcontainer/
│   └── devcontainer.json  # Dev container / Codespaces configuration
├── scripts/
│   └── setup.sh           # Automated environment setup script
├── Makefile               # Common developer tasks (run `make help`)
├── README.md              # Project overview and documentation
├── CONTRIBUTING.md        # Guidelines for contributing
├── CODE_OF_CONDUCT.md     # Code of conduct for contributors
├── LICENSE                # MIT License
└── .gitignore             # Git ignore rules
```

## Developer Tasks

| Command | Description |
|---|---|
| `make setup` | Run the automated environment setup script |
| `make validate-git` | Verify Git `user.name` and `user.email` are configured |
| `make help` | List all available make targets |

## Contributing

Contributions are welcome! Please read our [CONTRIBUTING.md](CONTRIBUTING.md) for details on our code of conduct and the process for submitting pull requests.

## Code of Conduct

This project adheres to a [Code of Conduct](CODE_OF_CONDUCT.md). By participating, you are expected to uphold this code.

## License

This project is licensed under the MIT License — see the [LICENSE](LICENSE) file for details.
