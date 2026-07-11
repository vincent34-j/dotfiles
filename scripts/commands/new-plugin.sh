#!/usr/bin/env bash

SDK_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../../sdk" && pwd)"

# shellcheck source=/dev/null
source "${SDK_DIR}/generator/plugin.sh"

run_new_plugin() {
    local plugin="${1:-}"

    [[ -z "${plugin}" ]] && {
        echo "Usage: creator new-plugin <plugin-name>"
        return 1
    }

    generate_plugin \
        "${plugin}" \
        "${plugin^} Plugin" \
        "${USER}"
}
