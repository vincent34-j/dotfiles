#!/usr/bin/env bash

show_disk() {

    echo "[Disk]"

    df -h / | awk 'NR==2 {
        printf "Root       : %s used / %s (%s)\n", $3, $2, $5
    }'

    echo

}

show_status() {

    echo "Creator Workstation Status"
    echo

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

        echo "Repository : Not a Git repository"

    fi

    echo

    show_disk

}
