# Ubuntu Post Install

An automatic set of scripts for Ubuntu, mainly.
This project is totally free software.
You can do whatever you want with it.

## Customization

You can customize all the files, but these are the most important ones:

* **data/git.env:** contains the user's data to configure `git` (_email_ and _name_)
* **data/pacakges.list:** list of packages to be installed with `apt`
* **data/snaps.list:** list of packages to be installed with `snap`
* **postinstall.d/*:** set of scripts tu run by main script. If you do not specify `-f`, you will be promted to run it.

## Usage

```sh
git clone -q --depth 1 https://github.com/snwh/ubuntu-post-install.git
cd ubuntu-post-install
./ubuntu-post-install.sh [-h] [-f]
```