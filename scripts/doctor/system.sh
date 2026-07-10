#!/usr/bin/env bash

check_docker_daemon() {
    if command -v docker >/dev/null 2>&1 &&
       docker info >/dev/null 2>&1; then
        pass "Docker daemon"
    else
        fail "Docker daemon"
    fi
}

check_git_repository() {
    if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
        pass "Git repository"
    else
        fail "Git repository"
    fi
}

check_git_remote() {
    if git remote get-url origin >/dev/null 2>&1; then
        pass "Git remote"
    else
        fail "Git remote"
    fi
}

check_git_branch() {
    local branch
    branch="$(git branch --show-current)"

    if [[ -n "${branch}" ]]; then
        pass "Git branch (${branch})"
    else
        fail "Git branch"
    fi
}

check_git_clean() {
    if [[ -z "$(git status --porcelain)" ]]; then
        pass "Working tree clean"
    else
        fail "Working tree clean"
    fi
}
