#!/bin/bash
# https://www.youtube.com/watch?v=qTF9Nmt3iXY&list=PLKopOf5__2tj0aVUX68Kyr9rNltrLTWDq&index=7&ab_channel=LinuxScoop

echo "Installing the necessary packages..."

sudo pacman -S --needed - < kde-packages

echo "The packages are installed!"

cd ~/Downloads
git clone https://gitlab.com/jomada/edna.git
cd Edna && ./install.sh
git clone https://github.com/vinceliuice/Tela-circle-icon-theme.git
cd Tela-circle-icon-theme && ./install.sh
git clone https://github.com/vinceliuice/McMojave-cursors.git
cd McMojave-cursors && ./install.sg

echo "Restoring KDE Plasma configurations..."

cp plasma-org.kde.plasma.desktop-appletsrc ~/.config/
cp plasmashellrc ~/.config/
cp kglobalshortcutsrc ~/.config/
cp khotkeysrc ~/.config/
cp kwinrc ~/.config/

cp -r plasma ~/.local/share/
cp -r aurorae ~/.local/share/
cp -r icons ~/.local/share/
cp -r plasma_icons ~/.local/share/

echo "KDE Plasma configuration successfully restored!\nThe configuration will take effect in 10 seconds..."
plasmashell --replace &
sudo reboot
