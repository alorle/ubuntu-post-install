#!/bin/bash

VERSION=8

curl -sL https://deb.nodesource.com/setup_${VERSION}.x | $sh_c "bash -" > /dev/null
$sh_c "apt-get install nodejs -y" > /dev/null