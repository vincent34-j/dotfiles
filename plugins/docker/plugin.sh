#!/usr/bin/env bash

plugin_install() {
    printf "Installing %s...\n" "${NAME}"
}

plugin_update() {
    printf "Updating %s...\n" "${NAME}"
}

plugin_remove() {
    printf "Removing %s...\n" "${NAME}"
}

plugin_doctor() {
    printf "Checking %s...\n" "${NAME}"
}

plugin_info() {
    printf "Plugin: %s\n" "${NAME}"
    printf "Version: %s\n" "${VERSION}"
    printf "Description: %s\n" "${DESCRIPTION}"
}
