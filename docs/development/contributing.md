# Contributing

Thank you for contributing to Creator Workstation.

## Development Workflow

1. Create a new feature branch.

```bash
git checkout -b feature/my-feature
```

2. Implement your changes.

3. Run the complete test suite.

```bash
bash scripts/tests/run.sh
```

4. Run ShellCheck.

```bash
shellcheck scripts/**/*.sh
```

5. Commit using clear commit messages.

Example:

```text
feat(cli): add status command
```

6. Push your branch.

```bash
git push origin feature/my-feature
```

7. Open a Pull Request.

## Coding Guidelines

- Prefer small reusable functions.
- Keep commands modular.
- Use ShellCheck-clean Bash.
- Test before committing.
