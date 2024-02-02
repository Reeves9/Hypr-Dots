#!/bin/bash

# installing chaotic aur and yay
sudo pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
sudo pacman-key --lsign-key 3056513887B78AEB
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst'
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'
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
  hyprpaper 
  swaylock-effects 
  wofi 
  wlogout 
  xdg-desktop-portal-hyprland 
  swappy 
  grim 
  slurp 
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
  visual-studio-code-bin 
  mpv 
  totem 
  tumbler 
  ffmpegthumbnailer 
  vulkan-radeon 
  bottles
  libva-mesa-driver 
  libva-vdpau-driver
  neovim 
  gnome-boxes  
  evince
  loupe
  kdenlive 
  krita 
  blender 
  obs-studio 
  qt5ct 
  qt6ct 
  nwg-look
  fish
  gvfs-mtp
  sddm-config-editor-git
  cargo
  ruby
  npm
  clang
  telegram-desktop
  scrcpy
  auto-cpufreq
  kvantum
  cheese
  prismlauncher
  cobang 
  webapp-manager
  xampp
  bibata-cursor-theme
  spotify-adblock-git
  qbittorrent
  gnome-calculator
  chromium-wayland-vaapi
  swaybg
  azote
  yazi
  jupyterlab
)

for package in "${packages[@]}"; do
  yay -S --noconfirm "$package"
done

#Enabling power management and bluetooth
sudo systemctl enable auto-cpufreq bluetooth 

#copying configs 
cp -r ./configs/* ~/.config/
cp -r ./Theme/* ~/.themes/
cp -r ./Icons/* ~/.icons/
cp -r ./Wallpapers/ ~/Pictures/Wallpapers/

#changing shell 
chsh -s /bin/fish
