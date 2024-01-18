#!/usr/bin/env bash

# ask questions #
read -p "Do you want alacritty config? (y/N): " alacritty
read -p "Do you want bspwm config? (y/N): " bspwm
read -p "Do you want fish config? (y/N): " fish
read -p "Do you want helix config? (y/N): " helix
read -p "Do you want nano config? (y/N): " nano
read -p "Do you want nitrogen config? (y/N): " nitrogen
read -p "Do you want variety config? (y/N): " variety
read -p "Do you want awesome config? (y/N): " awesome
read -p "Do you want conky config? (y/N): " conky
read -p "Do you want leftwm config? (y/N): " leftwm
read -p "Do you want neofetch config? (y/N): " neofetch
read -p "Do you want polybar config? (y/N): " polybar
read -p "Do you want xfce4 config? (y/N): " xfce4
read -p "Do you want pacman config? (y/N): " pacman
read -p "Do you want sound? (y/N) " sound

if [ "$1" = "--demo" ]; then
  exit 0;
fi

echo "Installation is starting..."

sleep 2

if ! command -v yay >/dev/null; then
  git clone https://aur.archlinux.org/yay-bin /tmp/yay
  cd /tmp/yay
  makepkg -si
  cd -
fi

mkdir ~/.config

case "$alacritty" in
[yY][eE][sS]|[yY])
cp -r dot_config/alacritty ~/.config
yay -S alacritty --noconfirm --needed
echo "Alacritty config installed."
;;
esac

case "$bspwm" in
[yY][eE][sS]|[yY])
cp -r dot_config/bspwm ~/.config
yay -S bspwm xorg-server --noconfirm --needed
echo "Bspwm config installed."
;;
esac

case "$fish" in
[yY][eE][sS]|[yY])
cp -r dot_config/fish{att,} ~/.config
yay -S fish --noconfirm --needed
echo "Fish config installed."
;;
esac

case "$helix" in
[yY][eE][sS]|[yY])
cp -r dot_config/helix ~/.config
yay -S helix --noconfirm --needed
echo "Helix config installed."
;;
esac

case "$nano" in
[yY][eE][sS]|[yY])
cp -r dot_config/nano ~/.config
yay -S nano --noconfirm --needed
echo "Nano config installed."
;;
esac

case "$nitrogen" in
[yY][eE][sS]|[yY])
cp -r dot_config/nitrogen ~/.config
yay -S nitrogen --noconfirm --needed
echo "Nitrogen config installed."
;;
esac

case "$variety" in
[yY][eE][sS]|[yY])
cp -r dot_config/variety ~/.config
yay -S variety --noconfirm --needed
echo "Variety config installed."
;;
esac

case "$awesome" in
[yY][eE][sS]|[yY])
cp -r dot_config/awesome ~/.config
yay -S awesome xorg-server --noconfirm --needed
echo "Awesome config installed."
;;
esac

case "$conky" in
[yY][eE][sS]|[yY])
cp -r dot_config/bspwm ~/.config
yay -S conky --noconfirm --needed
echo "Conky config installed."
;;
esac

case "$leftwm" in
[yY][eE][sS]|[yY])
cp -r dot_config/leftwm ~/.config
yay -S leftwm xorg-server --noconfirm --needed
echo "Leftwm config installed."
;;
esac

case "$neofetch" in
[yY][eE][sS]|[yY])
cp -r dot_config/neofetch ~/.config
yay -S neofetch xorg-server --noconfirm --needed
echo "Neofetch config installed."
;;
esac

case "$polybar" in
[yY][eE][sS]|[yY])
cp -r dot_config/polybar ~/.config
yay -S polybar --noconfirm --needed
echo "Polybar config installed."
;;
esac

case "$xfce4" in
[yY][eE][sS]|[yY])
cp -r dot_config/xfce4 ~/.config
yay -S xfce4-terminal xfce4-screenshooter xfce4-taskmanager
echo "xfce4 config installed."
;;
esac

case "$pacman" in
[yY][eE][sS]|[yY])
sudo cp pacman.conf /etc/
sudo pacman -Syu --noconfirm --needed
echo "pacman config installed."
;;
esac

case "$sound" in
[yY][eE][sS]|[yY])
yay -S pipewire wireplumber pipewire-pulse --noconfirm --needed
systemctl --user enable --now {pipewire,wireplumber,pipewire-pulse}
echo "pipewire installed."
;;
esac

read -p "Can we reboot your computer?: (y/N): " reboot

echo "Installation has been completed."

case "$reboot" in
[yY][eE][sS]|[yY])
sleep 3
sudo reboot
;;
esac
