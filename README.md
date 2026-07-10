# Creator Workstation

A modular Linux workstation automation framework designed for reproducible development environments.

Creator Workstation provides a complete toolkit for provisioning, maintaining, testing, and rebuilding a Linux workstation from source-controlled configuration.

---

# Features

- Modular CLI framework
- Automated provisioning
- Dotfiles management
- Package management
- Maintenance utilities
- Doctor diagnostics
- Status dashboard
- Backup framework
- Automated testing
- Release management

---

# Repository Structure

```text
config/          Application configuration
docs/            Project documentation
manifest/        Installation manifests

scripts/
    commands/    CLI commands
    core/        Shared runtime modules
    doctor/      Diagnostic framework
    lib/         Provisioning libraries
    maintenance/ Maintenance tools
    provision/   Provisioning engine
    tests/       Automated tests
```

---

# Architecture

```text
creator.sh
      │
      ▼
Dispatcher
      │
      ▼
Commands
      │
      ▼
Core Runtime
      │
      ▼
Libraries
```

---

# Installation

```bash
git clone git@github.com:vincent34-j/dotfiles.git

cd dotfiles

bash scripts/bootstrap.sh
```

---

# Quick Start

Display help

```bash
bash scripts/creator.sh
```

Run diagnostics

```bash
bash scripts/creator.sh doctor
```

Display workstation status

```bash
bash scripts/creator.sh status
```

Run automated tests

```bash
bash scripts/tests/run.sh
```

---

# CLI Commands

Current supported commands

- help
- info
- doctor
- status
- cleanup
- backup
- update
- install
- provision
- config
- version

---

# Testing

Run the complete test suite

```bash
bash scripts/tests/run.sh
```

---

# Roadmap

- Provisioning Framework
- Modular CLI
- Automated Testing
- CI Pipeline
- Documentation
- Plugin System
- Multi-distribution Support

---

# Documentation

Additional documentation will be available under the `docs/` directory.

---

# License

License will be added during the Release phase.
