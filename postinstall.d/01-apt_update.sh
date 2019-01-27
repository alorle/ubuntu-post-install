#!/bin/bash

$sh_c "apt update"
$sh_c "apt upgrade -y"
$sh_c "apt dist-upgrade -y"
$sh_c "snap refresh"