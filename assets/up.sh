#!/bin/bash

APT_FLAGS=''

function command_exists() {
	command -v "$@" > /dev/null 2>&1
}

usage() {
	echo "Usage: up [-y] [-f]
    -y,     Assume yes for all commands questions
    -f,     Continue without asking even if some command fails"
}

parse_args() {
	while getopts “hyf” OPTION
	do
		case $OPTION in
			h)
				usage
				exit 1
				;;
			y)
				APT_FLAGS+=' -y'
				;;
			f)
				APT_FLAGS+=' -y'
				;;
			?)
				usage
				exit
				;;
		esac
	done
}

check_exit_status() {
	if [ $? -eq 0 ]
	then
		echo -e "\033[1;33mSuccess\033[m"
	else
		echo -e "\033[1;31mERROR: Process Failed!\033[m"
		read -p "Exit script? (y/N) " -n 1 -r
		echo
		if [[ $REPLY =~ ^[YySs]$ ]]
		then
      [[ "$0" = "$BASH_SOURCE" ]] && exit 1 || return 1
		fi
	fi
}

greeting() {
	clear
  echo -e "\033[1;33mHello, $USER. Let's update this system.\033[m"
}

update() {
	echo
  echo -e "\033[1;32mUPDATING SYSTEM\033[m"

  $sh_c "apt update"; check_exit_status

  $sh_c "apt upgrade $APT_FLAGS"; check_exit_status

  $sh_c "apt dist-upgrade $APT_FLAGS"; check_exit_status

  if command_exists snap; then
	  $sh_c "snap refresh"; check_exit_status
  fi

  if command_exists npm; then
	  $sh_c "npm install -g npm"; check_exit_status
  fi
}

housekeeping() {
	echo
  echo -e "\033[1;32mCLEANING SYSTEM\033[m"

	$sh_c "apt autoremove $APT_FLAGS"; check_exit_status

	$sh_c "apt clean $APT_FLAGS"; check_exit_status

	$sh_c "apt autoclean $APT_FLAGS"; check_exit_status

  if command_exists updatedb; then
	  $sh_c "updatedb"; check_exit_status
  fi
}

leave() {
	echo -e "\033[1;35m"
	echo "--------------------"
	echo "- Update Complete! -"
	echo "--------------------"
	echo -e "\033[m"
	exit
}

sh_c='sh -c'
if [ "$user" != 'root' ]; then
  if command_exists sudo; then
    sh_c='sudo -E sh -c'
  elif command_exists su; then
    sh_c='su -c'
  else
    cat >&2 <<-'EOF'
			Error: this script needs the ability to run commands as root.
			We are unable to find either "sudo" or "su" available to make this happen.
		EOF
    exit 1
  fi
fi

parse_args $@
greeting
update
housekeeping
leave
