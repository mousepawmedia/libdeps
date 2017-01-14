#!/bin/bash
sudo apt update
sudo apt install autoconf libtool
cd opus && autoreconf -f -i

