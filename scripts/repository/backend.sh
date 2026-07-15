#!/usr/bin/env bash

repository_worktree() {
    local repo="$1"

    printf "%s/%s\n" \
        "$(repository_cache_root)" \
        "$repo"
}

repository_git_dir() {
    local repo="$1"

    printf "%s/.git\n" \
        "$(repository_worktree "$repo")"
}

repository_is_cloned() {
    local repo="$1"

    local gitdir
    gitdir="$(repository_git_dir "$repo")"

    [[ -d "$gitdir" ]] || return 1

    git \
        --git-dir="$gitdir" \
        rev-parse --git-dir >/dev/null 2>&1
}

repository_revision() {
    local repo="$1"

    if ! repository_is_cloned "$repo"; then
        return 1
    fi

    git \
        -C "$(repository_worktree "$repo")" \
        rev-parse HEAD
}

repository_clone() {
    local repo="$1"
    local url="$2"
    local branch="$3"

    local worktree
    worktree="$(repository_worktree "$repo")"

    if repository_is_cloned "$repo"; then
        return 0
    fi

    mkdir -p "$(dirname "$worktree")"

    rm -rf "$worktree"

    git clone \
        --depth 1 \
        --branch "$branch" \
        "$url" \
        "$worktree"
}

repository_fetch() {
    local repo="$1"

    repository_is_cloned "$repo" || return 1

    git \
        -C "$(repository_worktree "$repo")" \
        fetch --all --prune
}

repository_checkout() {
    local repo="$1"
    local branch="$2"

    repository_is_cloned "$repo" || return 1

    git \
        -C "$(repository_worktree "$repo")" \
        checkout "$branch"
}

repository_pull() {
    local repo="$1"

    repository_is_cloned "$repo" || return 1

    git \
        -C "$(repository_worktree "$repo")" \
        pull --ff-only
}

repository_default_branch() {
    local url="$1"

    git ls-remote --symref "$url" HEAD 2>/dev/null \
        | awk '/^ref:/ {sub("refs/heads/","",$2); print $2; exit}'
}

