#!/usr/bin/env bash

plugin_get_name() {
    printf "docker\n"
}

plugin_get_version() {
    printf "1.0.0\n"
}

plugin_get_description() {
    printf "Docker Development Environment\n"
}

plugin_install() {
    printf "Installing %s...\n" "$(plugin_get_name)"
}

plugin_update() {
    printf "Updating %s...\n" "$(plugin_get_name)"
}

plugin_remove() {
    printf "Removing %s...\n" "$(plugin_get_name)"
}

plugin_doctor() {
    printf "Checking %s...\n" "$(plugin_get_name)"
}

plugin_info() {
    printf "Plugin: %s\n" "$(plugin_get_name)"
    printf "Version: %s\n" "$(plugin_get_version)"
    printf "Description: %s\n" "$(plugin_get_description)"
}
