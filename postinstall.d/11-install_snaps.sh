#!/bin/bash

LIST="$(dirname "$0")/data/snaps.list"
# for PACKAGE in $(cat $LIST | grep -v '#'); do
#   echo_message success "Installing '$PACKAGE'"
#   $sh_c "snap install $PACKAGE"
# done

cat $LIST | grep -v '#' | while read PACKAGE; do
  echo_message success "Installing '$PACKAGE'"
  $sh_c "snap install $PACKAGE"
done