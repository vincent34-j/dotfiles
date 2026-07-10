#!/usr/bin/env bash

show_info() {
    cat <<EOF
Creator Workstation CLI

Version : ${CLI_VERSION}
Project : Creator Workstation
Shell   : ${SHELL}
User    : ${USER}
Host    : $(hostname)
Kernel  : $(uname -r)
EOF
}
