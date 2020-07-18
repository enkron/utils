#!/bin/bash


printUsage() {
    printf "${0} -o <old_text> -n <new_text>\n"
    exit 1
}

main() {
#swap <old_text> with <new_one> recursively in the project tree

    while getopts "o:n:" flags; do
        case "${flags}" in
            o) oldText=${OPTARG} ;;

            n) newText=${OPTARG} ;;

            *) printUsage ;;
        esac
    done
    shift $(( $OPTIND-1 ))

    if [ -z "${oldText}" ] || [ -z "${newText}" ]; then
        printUsage
    fi

    echo "${oldText}"
    echo "${newText}"

    egrep -lRi "${oldText}" "${PWD}"/* |xargs sed -e "s/"${oldText}"/"${newText}"/g" -i ''
}

main "${@}"
