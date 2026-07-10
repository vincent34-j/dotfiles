#!/usr/bin/env bash

# shellcheck source=/dev/null
source "${SCRIPT_DIR}/core/common.sh"

status_header() {

    echo
    echo "==============================="
    echo " Creator Workstation Status"
    echo "==============================="
    echo

}

status_git() {

    echo "[Git]"

    if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then

        echo "Repository : OK"

        echo "Branch     : $(git branch --show-current)"

        if git diff --quiet && git diff --cached --quiet; then
            echo "Status     : Clean"
        else
            echo "Status     : Modified"
        fi

    else

        echo "Repository : Not a git repository"

    fi

    echo

}

run_status_dashboard() {

    status_header

    status_git

}
