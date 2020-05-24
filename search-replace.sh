#!/bin/bash

main()
{
    local old_text="$1"
    local new_text="$2"

    egrep -lRi "$old_text" "$PWD"/* |xargs sed -e "s/"$old_text"/"$new_text"/g" -i ''
}

main "$1" "$2"
