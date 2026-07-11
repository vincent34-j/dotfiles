#!/usr/bin/env bash

GENERATOR_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# shellcheck source=/dev/null
source "${GENERATOR_DIR}/../lib/template.sh"

generate_plugin() {
    local name="$1"
    local description="$2"
    local author="$3"

    [[ -z "${name}" ]] && {
        echo "Plugin name is required."
        return 1
    }

    [[ "${name}" =~ ^[a-z0-9_-]+$ ]] || {
        echo "Invalid plugin name: ${name}"
        return 1
    }

    local root="plugins/${name}"

    [[ ! -e "${root}" ]] || {
        echo "Plugin already exists: ${name}"
        return 1
    }

    mkdir -p "${root}"

    template_render \
        sdk/templates/plugin.manifest.template \
        PLUGIN_NAME="${name}" \
        PLUGIN_DESCRIPTION="${description}" \
        AUTHOR="${author}" \
        > "${root}/plugin.manifest"

    template_render \
        sdk/templates/plugin.sh.template \
        > "${root}/plugin.sh"

    template_render \
        sdk/templates/README.md.template \
        PLUGIN_NAME="${name}" \
        PLUGIN_DESCRIPTION="${description}" \
        AUTHOR="${author}" \
        > "${root}/README.md"

    chmod +x "${root}/plugin.sh"

    printf "Plugin created: %s\n" "${root}"
}
