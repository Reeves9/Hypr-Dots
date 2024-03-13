#!/bin/bash

# installing chaotic aur and yay
sudo pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
sudo pacman-key --lsign-key 3056513887B78AEB
sudo pacman -U --noconfirm 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' 
sudo pacman -U --noconfirm 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'
sudo cp pacman.conf /etc/
sudo pacman -Sy
sudo pacman -S yay
yay -Syu

# installing packages
packages=(
  hyprland 
  kitty 
  waybar 
  jq 
  mako 
  hyprlock-git
  hypridle-git
  hyprpaper
  wofi 
  wlogout 
  xdg-desktop-portal-hyprland 
  hyprshot
  thunar 
  polkit-gnome 
  python-requests 
  pamixer 
  pavucontrol 
  brightnessctl 
  bluez 
  bluez-utils 
  blueman 
  network-manager-applet 
  gvfs 
  thunar-archive-plugin 
  file-roller 
  btop 
  pacman-contrib 
  starship 
  ttf-jetbrains-mono-nerd 
  noto-fonts-emoji  
  xfce4-settings 
  sddm 
  qt5-svg 
  qt5-quickcontrols2 
  qt5-graphicaleffects 
  qt5-wayland 
  qt6-wayland 
  amberol 
  libreoffice-fresh 
  code
  code-marketplace 
  mpv 
  tumbler 
  ffmpegthumbnailer 
  vulkan-radeon 
  libva-mesa-driver 
  libva-vdpau-driver
  neovim 
  evince
  loupe
  obs-studio 
  qt5ct 
  qt6ct 
  nwg-look
  fish
  gvfs-mtp
  sddm-config-editor-git
  clang
  auto-cpufreq
  kvantum
  cheese
  spotify-adblock-git
  qbittorrent
  gnome-calculator
  thorium-browser-bin
  yazi
  xwaylandvideobridge
  kitty-xterm-symlinks
)

for package in "${packages[@]}"; do
  yay -S --noconfirm "$package"
done

#Enabling power management and bluetooth
sudo systemctl enable auto-cpufreq bluetooth sddm

#Making theme directory
mkdir ~/.config
mkdir ~/.themes
mkdir ~/.icons

#copying configs 
cp -r ./configs/* ~/.config/
cp -r ./Themes/* ~/.themes/
cp -r ./Icons/* ~/.icons/
cp -r ./Wallpapers/ ~/Pictures/

#changing shell 
chsh -s /bin/fish

