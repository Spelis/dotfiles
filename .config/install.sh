#!/bin/zsh

echo "love from spelis :3 (script starting in 10 seconds)"
sleep 10
echo "moving dotfiles"
mv * ../
echo "installing paru"
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si --noconfirm
cd ..
echo "installing essential and small amounts of bloatware"
paru -Syyuu --noconfirm visual-studio-code-bin hyprland-git neovim-git webcord google-chrome npm wget zsh kitty tmux steam spotify rofi thunar thunderbird btop libresprite pavucontrol python3 nwg-look unzip zsh-theme-powerlevel10k xdg-desktop-portal xdg-desktop-portal-hyprland base-devel curl ocs-url lolcat
echo "symlinking so vi runs nvim"
ln -s /usr/bin/nvim /usr/bin/vi
echo "installing fonts"
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.0/Gohu.zip
mkdir Gohu
unzip Gohu.zip -d Gohu
cd Gohu
mv GohuFont11NerdFontMono-Regular.ttf /home/$USER/.fonts/
mv GohuFont14NerdFontMono-Regular.ttf /home/$USER/.fonts/
fc-cache
echo "switching shell"
chsh -s /usr/bin/zsh

