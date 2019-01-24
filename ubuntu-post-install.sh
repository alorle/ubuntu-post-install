#!/bin/bash

function import_libs {
  LIBS_DIR="$(dirname "$0")/lib"
	for LIB_SCRIPT in $LIBS_DIR/*; do
		if [[ -d $LIB_SCRIPT ]]; then
		  # skip directories
			continue
		elif [[ $LIB_SCRIPT == *.md ]]; then
		  # exclude markdown readmes
			continue
		elif [[ -f $LIB_SCRIPT ]]; then
			# source the function file
			. $LIB_SCRIPT
		fi
	done
}

function execute_partials {
  PARTIALS_DIR="$(dirname "$0")/postinstall.d"
  if [[ -d $PARTIALS_DIR ]]; then
    for PARTIAL_SCRIPT in $PARTIALS_DIR/*; do
      if [[ -d $PARTIAL_SCRIPT ]]; then
        # skip directories
        continue
      elif [[ $PARTIAL_SCRIPT == *.md ]]; then
        # exclude markdown readmes
        continue
      elif [[ -f $PARTIAL_SCRIPT ]]; then
        if [[ FORCE -eq 0 ]]; then
          echo_message question 'Would you like to run '$(basename $PARTIAL_SCRIPT)'? (y/N) : ' && read REPLY
          case $REPLY in
          [Yy]* )
            # source the function file
            . $PARTIAL_SCRIPT
            ;;
          esac
        else
          echo_message title "Running '$(basename $PARTIAL_SCRIPT)' ..."
          . $PARTIAL_SCRIPT
        fi
      fi
    done
  fi
}

function usage {
  echo "Usage: $0 [-f] [-h]
    -f    Force to run all scripts under \"$(dirname "$0")/postinstall.d\"
    -h    Show help" 1>&2
  exit 1
}

function main {
  case `uname -i` in
    i386|i486|i586|i686)
      ARCH="i386"
      ;;
    x86_64)
      ARCH="amd64"
      ;;
    *)
      cat >&2 <<-'EOF'
			Error: no compatible arch.
			EOF
      exit 1
  esac

  import_libs

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

  echo_message welcome 'Welcome to "Ubuntu Post-Install Script"'
  system_checks
  execute_partials
  echo_message welcome 'Thanks for using. Bye!! \U1F601'
}

FORCE=0
while getopts "hf" o; do
  case "${o}" in
      h)
          usage
          ;;
      f)
          FORCE=1
          ;;
      *)
          usage
          ;;
  esac
done
shift $((OPTIND-1))

main
