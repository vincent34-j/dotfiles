#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# shellcheck disable=SC1091
source "${SCRIPT_DIR}/../lib/bootstrap.sh"

# shellcheck disable=SC1091
source "${SCRIPT_DIR}/output.sh"

# shellcheck disable=SC1091
source "${SCRIPT_DIR}/header.sh"

# shellcheck disable=SC1091
source "${SCRIPT_DIR}/commands.sh"

# shellcheck disable=SC1091
source "${SCRIPT_DIR}/git.sh"

# shellcheck disable=SC1091
source "${SCRIPT_DIR}/creator.sh"

# shellcheck disable=SC1091
source "${SCRIPT_DIR}/system.sh"

# shellcheck disable=SC1091
source "${SCRIPT_DIR}/git.sh"

# shellcheck disable=SC1091
source "${SCRIPT_DIR}/summary.sh"

print_header

# shellcheck disable=SC2034
PASS_COUNT=0

# shellcheck disable=SC2034
FAIL_COUNT=0

check_file() {
    local path="$1"
    local display_name="$2"

    if [[ -f "${PROJECT_ROOT}/${path}" ]]; then
        pass "${display_name}"
    else
        fail "${display_name}"
    fi
}

check_directory() {
    local path="$1"
    local display_name="$2"

    if [[ -d "${PROJECT_ROOT}/${path}" ]]; then
        pass "${display_name}"
    else
        fail "${display_name}"
    fi
}

check_command_version git "Git"
check_command_version bash "Bash"
check_command_version shellcheck "ShellCheck"
check_command_version gh "GitHub CLI"
check_command_version docker "Docker"
check_command_version node "Node.js"
check_command_version npm "npm"
check_command_version python3 "Python"
check_command_version pip3 "pip"
check_command_version pipx "pipx"
check_command_version code "VS Code"
check_command_version ollama "Ollama"
check_command_version cmake "CMake"
check_command_version gcc "GCC"
check_command_version make "Make"

check_version_file
check_changelog
check_test_suite
check_github_actions

check_docker_daemon
check_git_repository
check_git_remote
check_git_branch
check_git_clean

show_summary
