#!/bin/bash

print_usage() {
    read -r -d '' help_msg <<- EOF
    Usage: $0 -n <RFC number>

    Save given RFC doc to the file

    Options:
    -n      Saves given RFC document to the target file

    -h      Prints this help message and exited
EOF
    printf '%s\n' "${help_msg}"
    exit 1
}

get_rfc() {
    local ietf_url="https://tools.ietf.org/rfc/rfc${1}.txt"

    curl $ietf_url >rfc${1}.txt
}

main() {
    while getopts "n:h" flag; do
        case "${flag}" in
        n) rfc_num=${OPTARG} ;;

        h) print_usage ;;
        esac
    done
    shift $(( OPTIND - 1 )) #resetting index

    if [[ $rfc_num == "" ]]; then
        read -p "rfc num: " rfc_num
    fi

    get_rfc ${rfc_num}
}


main "${@}"
