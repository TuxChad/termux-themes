#!/data/data/com.termux/files/usr/bin/bash
termux-setup-storage

apt update
yes | apt install git zsh 
git clone https://github.com/TuxChad/termux-themes.git "$HOME/termux-theme" --depth 1

mv "$HOME/.termux" "$HOME/.termux.backup.$(date +%Y.%m.%d-%H:%M:%S)"
cp -R "$HOME/termux-theme/.termux" "$HOME/.termux"

git clone https://github.com/ohmyzsh/ohmyzsh.git "$HOME/.oh-my-zsh" --depth 1
mv "$HOME/.zshrc" "$HOME/.zshrc.backup.$(date +%Y.%m.%d-%H:%M:%S)"
cp "$HOME/.oh-my-zsh/templates/zshrc.zsh-template" "$HOME/.zshrc"
sed -i '/^ZSH_THEME/d' "$HOME/.zshrc"
sed -i '1iZSH_THEME="robbyrussell"' "$HOME/.zshrc"
echo "alias chcolor='$HOME/.termux/colors.sh'" >> "$HOME/.zshrc"

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$HOME/.zsh-syntax-highlighting" --depth 1
echo "source $HOME/.zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> "$HOME/.zshrc"

chsh -s zsh

wget -O font.ttf https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/JetBrainsMono/Ligatures/SemiBold/JetBrainsMonoNerdFont-SemiBold.ttf # downloads JetBrainsMonoNerdFont-SemiBold font 
mv font.ttf ~/.termux/ # set as default font

wget https://github.com/dylanaraps/pfetch/raw/master/pfetch
mv pfetch /data/data/com.termux/files/usr/bin/

echo "oh-my-zsh install complete!\nChoose your color scheme now~"
$HOME/.termux/colors.sh

echo "Please restart Termux app..."

exit
