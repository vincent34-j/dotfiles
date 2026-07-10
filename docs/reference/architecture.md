# Architecture

Creator Workstation is organized into several independent layers.

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
Provision Libraries
      │
      ▼
System
```

## Components

### creator.sh

Main CLI entry point.

### Dispatcher

Routes commands to their implementation.

### Commands

Small wrapper scripts implementing CLI actions.

Examples:

- doctor
- status
- cleanup
- provision

### Core

Shared runtime functionality.

Includes:

- runtime
- registry
- filesystem
- cleanup
- cache
- status
- summary

### Libraries

Reusable provisioning helpers.

Examples:

- package manager
- service manager
- font manager

### Tests

Automated regression tests for CLI and libraries.

### Doctor

System diagnostics framework.
