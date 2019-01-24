#!/bin/bash

$sh_c "apt-get update" > /dev/null
$sh_c "apt-get upgrade -y" > /dev/null
$sh_c "apt-get dist-upgrade -y" > /dev/null
$sh_c "snap refresh" > /dev/null