#!/bin/bash

LIST="$(dirname "$0")/data/packages.list"
for PACKAGE in $(cat $LIST | grep -v '#'); do
  echo_message success "Installing '$PACKAGE'"
  $sh_c "apt install -y $PACKAGE"
done