#!/bin/bash

LIST="$(dirname "$0")/data/snaps.list"
for PACKAGE in $(cat $LIST | grep -v '#'); do
  # If package is not installed
  if [ $(check_package_installed $PACKAGE) != 0 ]; then
		echo_message success "Installing '$PACKAGE'"
    $sh_c "snap install $PACKAGE" > /dev/null
  fi
done