#!/bin/bash

function main() {
    local apps=( "Telegram" "Microsoft Teams" "Mail" )

    for a in "${apps[@]}"; do
        open -a "$a"
    done
}


main
