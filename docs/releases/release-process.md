# Release Process

## 1. Update Version

Edit:

- VERSION
- CHANGELOG.md

## 2. Run Tests

```bash
bash scripts/tests/run.sh
```

## 3. Run ShellCheck

```bash
shellcheck scripts/**/*.sh
```

## 4. Commit

```bash
git commit -m "Release vX.Y.Z"
```

## 5. Create Tag

```bash
git tag -a vX.Y.Z -m "Release"
```

## 6. Push

```bash
git push origin main
git push origin --tags
```

## 7. Verify

```bash
git tag
git status
```

Working tree should be clean.
