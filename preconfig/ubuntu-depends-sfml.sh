#!/bin/bash
echo "Installing dependencies for SFML..."
echo "Updating apt cache. You will be able to approve package install."
sudo apt update -qq
sudo apt install libudev-dev libopenal-dev libflac-dev libogg-dev libvorbis-dev libjpeg-dev libfreetype6-dev libx11-dev libxrandr-dev libx11-xcb-dev libxcb-randr0-dev libxcb-image0-dev libpthread-stubs0-dev libgl1-mesa-dev
