#!/bin/bash
echo "Updating apt. You will have the chance to approve package installs, if any are needed."
sudo apt update
sudo apt install autoconf libtool
echo "Reconfiguring opus."
cd opus && autoreconf -f -i

