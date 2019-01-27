#!/bin/bash
#
# Original Authors:
#   Sam Hewitt <sam@snwh.org>
#
# Original source:
#   https://github.com/snwh/ubuntu-post-install/blob/master/functions/check_functions
#

# Check which distribution the user is running
function check_os {
	# Variables
	OS_NAME="Linux"

	# Abort if not Linux
	if [[ $(uname) != "$OS_NAME" ]]; then
		echo_message error "You don't appear to be using $OS_NAME! Aborting."
		exit 99
	fi
}

# Check which distribution the user is running
function check_distribution {
	# Check if 'lsb_release' exists
	if [[ $(which lsb_release &>/dev/null; echo $?) != 0 ]]; then
		echo_message error "\aCan't check which distribution you are using! Aborting."
		echo_message error " Aborting..." && sleep 3 && exit 99
	else
		# if Ubuntu
		if lsb_release -ds | grep -qE '(Ubuntu)'; then
			echo_message success "You are using Ubuntu."
		# if Mint or elementary
		elif lsb_release -ds | grep -qE '(Mint|elementary)'; then
			echo_message success "You are using an Ubuntu-based distribution. It's probably fine."
		# if Debian
		elif lsb_release -ds | grep -q 'Debian'; then
			echo_message warning "You are using Debian. This is not recommended. Some functions may not work. :/"
		# if anything else
		else
			echo_message warning "You are using a distribution that may not be compatible with this script set."
			echo_message warning "Proceeding may break your system."
			echo_message question "Are you sure you want to continue? (y/N) : " && read REPLY
			case $REPLY in
			# Positive action
			[Yy]* )
				echo_message warning "You have been warned."
				;;
			# Negative action or invalid
			* )
				echo_message info "Exiting..."
				exit 99
				;;
			esac
		fi
	fi
}

# Check for and install if missing the required packages for this script set.
function check_dependencies {
	echo_message title "Checking if necessary dependencies are installed..."
	# Variables
	LIST="$(dirname "$0")/data/dependencies.list"
	# Check dependencies
	for PACKAGE in $(cat $LIST | grep -v '#'); do
		echo_message success "Installing '$PACKAGE'"
		$sh_c "apt install -y $PACKAGE"
	done
	echo_message success "All dependencies are installed."
}

# Check if command exists
function command_exists() {
	command -v "$@" > /dev/null 2>&1
}

# Run system checks
function system_checks {
	# Check OS
	check_os
	# Check distribution
	check_distribution
	# Check dependencies
	check_dependencies
}
