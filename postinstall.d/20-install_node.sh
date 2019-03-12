#!/bin/bash

VERSION=10

curl -sL https://deb.nodesource.com/setup_${VERSION}.x | $sh_c "bash -"
$sh_c "apt install nodejs -y"