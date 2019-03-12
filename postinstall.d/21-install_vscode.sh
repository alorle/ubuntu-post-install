#!/bin/bash

wget -qO /tmp/vscode.deb https://go.microsoft.com/fwlink/?LinkID=760868
$sh_c "dpkg -i /tmp/vscode.deb"
rm /tmp/vscode.deb