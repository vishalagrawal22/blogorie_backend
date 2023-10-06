#!/usr/bin/env bash

yes_no() {
    declare desc="Prompt for confirmation. \$\"\{1\}\" is the confirmation message."

    local message="${1}"

    local choice
    read -r -p "${message} (y/[n])? " choice

    if [[ "${choice}" =~ ^[Yy]$ ]]; then
        exit 0
    else
        exit 1
    fi
}
