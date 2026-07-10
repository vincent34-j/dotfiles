# Plugin Architecture

## Overview

Creator Workstation uses a modular plugin architecture to keep the core framework
small, maintainable, and extensible.

The core framework is responsible for:

- discovering plugins
- loading plugins
- validating plugins
- registering plugins
- dispatching commands

Plugins are responsible only for implementing functionality.

---

## Goals

- Loose coupling
- High cohesion
- Extensible
- Easy to maintain
- Easy to test

---

## Directory Layout

```text
plugins/
    docker/
        plugin.sh

    python/
        plugin.sh

scripts/core/
    dispatcher.sh
    loader.sh
    registry.sh
```

---

## Plugin Contract

Every plugin must provide:

```bash
PLUGIN_NAME=""
PLUGIN_VERSION=""
PLUGIN_DESCRIPTION=""
```

Optional metadata:

```bash
PLUGIN_AUTHOR=""
PLUGIN_DEPENDENCIES=()
PLUGIN_MIN_CORE=""
```

Plugin functions use a unique prefix:

```bash
docker_install()
docker_update()
docker_remove()
docker_doctor()
```

---

## Core Components

### Dispatcher

Responsible for parsing user commands and invoking the correct plugin action.

### Loader

Responsible for:

- discovering plugins
- sourcing plugin entry files
- validating plugin metadata
- registering plugins

### Registry

Stores all plugin metadata and provides lookup APIs.

---

## Design Principles

- Single Responsibility Principle
- Open/Closed Principle
- Convention over Configuration
- Fail Gracefully
- Keep Core Independent from Plugins

---

## Future Extensions

Possible future features:

- Plugin repository
- Remote plugins
- Plugin dependencies
- Plugin version constraints
- Plugin enable/disable
- Plugin marketplace
