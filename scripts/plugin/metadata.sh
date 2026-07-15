#!/usr/bin/env bash

plugin_author() {
    printf "%s\n" "${PLUGIN_AUTHOR:-}"
}

plugin_license() {
    printf "%s\n" "${PLUGIN_LICENSE:-}"
}

plugin_homepage() {
    printf "%s\n" "${PLUGIN_HOMEPAGE:-}"
}

plugin_repository() {
    printf "%s\n" "${PLUGIN_REPOSITORY:-}"
}

plugin_tags() {
    printf "%s\n" "${PLUGIN_TAGS:-}"
}
