#!/usr/bin/env bash

command_exists() {

    declare -F "$1" >/dev/null

}

list_commands() {

    cat <<EOF
doctor
info
status
cleanup
update
backup
provision
install
config
version
help
EOF

}

is_valid_command() {

    local cmd="$1"

    list_commands | grep -qx "${cmd}"

}
