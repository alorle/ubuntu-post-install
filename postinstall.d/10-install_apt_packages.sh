#!/bin/bash

LIST="$(dirname "$0")/data/packages.list"
for PACKAGE in $(cat $LIST | grep -v '#'); do
  # If package is not installed
  if [ $(check_package_installed $PACKAGE) != 0 ]; then
		echo_message success "Installing '$PACKAGE'"
    $sh_c "apt install -y $PACKAGE" > /dev/null
  fi
done