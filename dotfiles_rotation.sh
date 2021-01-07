#!/bin/bash


ENV_DIR="${HOME}/Documents/env"
PLATFORM=`uname`

declare -a rotation_files=(
    '.tmux.conf'
    '.bash_profile'
    '.zshrc'
    '.vimrc'
    '.local'
    '.ssh'
    '.aws'
    '.alacritty.yml'
    '.gitconfig'
)

firefox_profile_home="${HOME}/Library/Application Support/Firefox/Profiles"
firefox_profile_name=`ls "${firefox_profile_home}"`
firefox_cfg="${firefox_profile_home}/${firefox_profile_name}/user.js"

for dotf in ${rotation_files[@]}; do
    rm -rf "${ENV_DIR}/dotfiles/${PLATFORM}/${dotf:1}" #cleanup
    cp -fR "${HOME}/${dotf}" "${ENV_DIR}/dotfiles/${PLATFORM}/${dotf:1}"
done

cp "${firefox_cfg}" "${ENV_DIR}/firefox"

brew bundle dump && mv Brewfile "${ENV_DIR}/homebrew"

pip3 freeze >"${ENV_DIR}/pip3/requirements.txt"

cd "${ENV_DIR}"
git add . && git commit -m "[${0}] files has been rotated." && git push

