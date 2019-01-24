#!/bin/bash

$sh_c "apt-get autoremove -y" > /dev/null
$sh_c "apt-get clean -y" > /dev/null
$sh_c "apt-get autoclean -y" > /dev/null
