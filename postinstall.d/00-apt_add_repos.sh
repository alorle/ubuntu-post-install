#!/bin/bash

$sh_c "add-apt-repository universe" > /dev/null
$sh_c "add-apt-repository ppa:git-core/ppa -y" > /dev/null
$sh_c "add-apt-repository ppa:webupd8team/java -y" > /dev/null
$sh_c "add-apt-repository ppa:snwh/pulp -y" > /dev/null
$sh_c "add-apt-repository ppa:system76/pop -y" > /dev/null