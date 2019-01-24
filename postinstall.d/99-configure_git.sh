#!/bin/bash

. $(dirname "$0")/data/git.env

git config --global color.ui true
git config --global push.default simple
git config --global user.email "$EMAIL"
git config --global user.name "$NAME"

git config --global alias.a 'add'
git config --global alias.ap 'add -p'
git config --global alias.c 'commit -s --verbose'
git config --global alias.ca 'commit -s -a --verbose'
git config --global alias.cm 'commit -s -m'
git config --global alias.cam 'commit -s -a -m'
git config --global alias.cma 'commit -s -a -m'
git config --global alias.m 'commit -s --amend --verbose'

git config --global alias.d 'diff'
git config --global alias.ds 'diff --stat'
git config --global alias.dc 'diff --cached'

git config --global alias.s 'status -s'
git config --global alias.co 'checkout'
git config --global alias.cob 'checkout -b'

# one-line log
git config --global alias.l 'log --pretty=format:"%C(yellow)%h\\ %ad%Cred%d\\ %Creset%s%Cblue\\ [%cn]" --decorate --date=short'

# list branches sorted by last modified
git config --global alias.b "!git for-each-ref --sort='-authordate' --format='%(authordate)%09%(objectname:short)%09%(refname)' refs/heads | sed -e 's-refs/heads/--'"

# list aliases
git config --global alias.la "!git config -l | grep alias | cut -c 7-"