#!/bin/bash

$sh_c "apt autoremove -y"
$sh_c "apt clean -y"
$sh_c "apt autoclean -y"
