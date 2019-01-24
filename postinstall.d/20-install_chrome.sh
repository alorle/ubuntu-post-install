#!/bin/bash

CHANNEL="stable"

wget -qO /tmp/google-chrome-${CHANNEL}.deb https://dl.google.com/linux/direct/google-chrome-${CHANNEL}_current_${ARCH}.deb > /dev/null
$sh_c "dpkg -i /tmp/google-chrome-${CHANNEL}.deb" > /dev/null
rm /tmp/google-chrome-${CHANNEL}.deb > /dev/null