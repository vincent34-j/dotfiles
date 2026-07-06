# Manifest Format

Manifest files define which files should be installed by the dotfiles installer.

Each line uses the following format:

source|target

Where:

- `source` is the path inside this repository.
- `target` is the destination on the local machine.

Example:

config/git/.gitconfig|~/.gitconfig
config/git/.gitignore_global|~/.gitignore_global

Rules:

- One mapping per line.
- Empty lines are ignored.
- Lines beginning with `#` are treated as comments.
- Paths beginning with `~` are expanded to the user's HOME directory.

Current manifests:

- git.manifest
- zsh.manifest
- vscode.manifest
