# Installation

This guide explains how to install Creator Workstation from scratch.

---

# Requirements

- Linux Mint 22+
- Git
- Bash
- Internet connection

---

# Clone Repository

```bash
git clone git@github.com:vincent34-j/dotfiles.git

cd dotfiles
```

---

# Bootstrap

Run:

```bash
bash scripts/bootstrap.sh
```

The bootstrap script installs the required environment and prepares the workstation.

---

# Verify Installation

Run:

```bash
bash scripts/creator.sh doctor
```

Expected output:

- Git detected
- Python detected
- CLI available
- Environment ready

---

# Next Step

Continue with the Quick Start guide.

See:

```
docs/getting-started/quick-start.md
```
