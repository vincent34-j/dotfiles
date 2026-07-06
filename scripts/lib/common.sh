#!/usr/bin/env bash

#######################################
# Logging
#######################################

info() {
    echo "[INFO ] $*"
}

success() {
    echo "[ OK  ] $*"
}

warn() {
    echo "[WARN ] $*"
}

error() {
    echo "[ERROR] $*"
}

#######################################
# Command Helpers
#######################################

command_exists() {
    command -v "$1" >/dev/null 2>&1
}

command_version() {
    "$1" --version | head -n1
}

check_command() {
    local cmd="$1"
    local name="$2"

    info "Checking ${name}..."

    if command_exists "$cmd"; then
        success "$(command_version "$cmd")"
    else
        error "${name} is not installed."
        return 1
    fi
}

#######################################
# Filesystem Helpers
#######################################

ensure_directory() {
    local dir="$1"

    if [[ -d "$dir" ]]; then
        info "Directory exists: $dir"
    else
        mkdir -p "$dir"
        success "Created directory: $dir"
    fi
}

backup_file() {
    local file="$1"

    if [[ -f "$file" || -L "$file" ]]; then
        local backup="${file}.bak.$(date +%Y%m%d-%H%M%S)"
        cp -a --preserve=all "$file" "$backup"
        success "Backup created: $backup"
    fi
}

create_symlink() {
    local source="$1"
    local target="$2"

    if [[ -L "$target" ]]; then
        local current_target
        current_target="$(readlink "$target")"

        if [[ "$current_target" == "$source" ]]; then
            info "Symlink already correct: $target"
            return 0
        fi

        warn "Replacing incorrect symlink: $target"
        rm -f "$target"
    fi

    if [[ -e "$target" ]]; then
        backup_file "$target"
        rm -rf "$target"
    fi

    ln -s "$source" "$target"

    success "Linked: $target -> $source"
}

install_file() {
    local source="$1"
    local target="$2"

    if [[ ! -e "$source" ]]; then
        error "Source not found: $source"
        return 1
    fi

    if [[ -L "$target" ]]; then
        local current
        current="$(readlink "$target")"

        if [[ "$current" == "$source" ]]; then
            info "Already installed: $target"
            return 0
        fi
    fi

    create_symlink "$source" "$target"
}

install_manifest() {
    local manifest="$1"

    if [[ ! -f "$manifest" ]]; then
        error "Manifest not found: $manifest"
        return 1
    fi

    info "Installing manifest: $(basename "$manifest")"

    while IFS='|' read -r source target
    do
        [[ -z "$source" ]] && continue
        [[ "$source" =~ ^# ]] && continue

        target="${target/#\~/$HOME}"

        install_file \
            "$ROOT_DIR/$source" \
            "$target"

    done < "$manifest"
}
