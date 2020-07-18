#!/bin/bash


env_dir="${HOME}/Documents/env"
platform=`uname`

declare -a rotation_files=(".tmux.conf" ".bash_profile" ".zshrc"
    ".vimrc" ".local" ".ssh" ".aws"
)

firefox_profile_home="${HOME}/Library/Application Support/Firefox/Profiles"
firefox_profile_name=`ls "${firefox_profile_home}"`
firefox_cfg="${firefox_profile_home}/${firefox_profile_name}/user.js"

main() {

    for dotf in ${rotation_files[@]}; do
        rm -rf "${env_dir}/dotfiles/${platform}/${dotf:1}" #cleanup
        cp -fR "${HOME}/${dotf}" "${env_dir}/dotfiles/${platform}/${dotf:1}"
    done

    cp "${firefox_cfg}" "${env_dir}/firefox"

    brew bundle dump && mv Brewfile "${env_dir}/homebrew"

    pip3 freeze >"${env_dir}/pip3/requirements.txt"

    cd "${env_dir}" && git commit -am "[${0}] files has been rotated." && git push
}


main
