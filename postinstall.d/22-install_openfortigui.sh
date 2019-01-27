#!/bin/bash

$sh_c "apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 2FAB19E7CCB7F415"
$sh_c 'echo "deb https://apt.iteas.at/iteas $(lsb_release -cs) main" > /etc/apt/sources.list.d/iteas.list'
$sh_c "apt install openfortigui -y"