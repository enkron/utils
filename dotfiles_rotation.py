#!/usr/bin/env python3 # -*- coding: utf-8 -*-

import os
import logging

import shutil

LOG = logging.getLogger(__name__)

def dotfile_rotation(*args):
    """Returns exit_status after files rotation tries.

    :param *args: List of files to rotate
    :return: Exit status
    """
    home = os.environ['HOME']
    #storage = f"{home}/Documents/env/dotfiles"

    for dotfile in args:
        if os.path.isdir(f"{home}/{dotfile}"):
            shutil.copytree(f"{home}/{dotfile}", f"{home}/dotfiles")
        else:
            shutil.copy(f"{home}/{dotfile}", f"{home}/dotfiles")

    return LOG.info("files has been successfully rotated.")


def main():
    dotfile_rotation('.tmux.conf', '.bash_profile', '.zshrc',
        '.vimrc', '.local')


if __name__ == '__main__': main()
