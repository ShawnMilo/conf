#!/usr/bin/env python

from os.path import abspath, dirname, join, exists
from os import chdir, getenv

home = getenv('HOME')
path = dirname(abspath(__file__))
chdir(path)

configs = (
    ( 'i3/config', '.config/i3/config'),
    ( 'fceux.cfg', '.config/fceux/fceux.cfg'),
    ( '.tmux.conf', '.tmux.conf'),
    ( 'parcelliterc', '.config/parcellite/parcelliterc'),
    ( 'vimrc', '.vimrc'),
    ( '.bashrc', '.bashrc'),
)

for cfg, local in configs:
    local = join(home, local)
    if not exists(local):
        print "{0} does not exist".format(local)
        continue
