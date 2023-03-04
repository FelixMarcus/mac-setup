[[ -d $USER_DIR/.oh-my-zsh ]] && echo "Uninstalling old oh-my-zsh instance" && $USER_DIR/.oh-my-zsh/tools/uninstall.sh#!/usr/bin/env bash

USER_DIR=/Users/$USER
echo Detected User Directory of $USER_DIR

echo Cleaning up any left over state

[[ -d $USER_DIR/.oh-my-zsh ]] && \
	echo "Uninstalling old oh-my-zsh instance" && \
	chmod +x $USER_DIR/.oh-my-zsh/tools/uninstall.sh && \
	printf 'y\n' | $USER_DIR/.oh-my-zsh/tools/uninstall.sh

rm -f $USER_DIR/.zshrc 2>/dev/null || echo No .zshrc file found 2>/dev/null
unlink $USER_DIR/.zshrc 2>/dev/null || echo No .zshrc link found 2>/dev/null
rm -f $USER_DIR/.p10k.zsh 2>/dev/null || echo no .p10k.zsh file found 2>/dev/null
unlink $USER_DIR/.p10k.zsh 2>/dev/null || echo no .p10k.zsh link found 2>/dev/null
unlink /usr/local/opt/openjdk/libexec/openjdk.jdk/openjdk.jdk 2>/dev/null || echo No openjdk link found 2>/dev/null

echo '\n\n'

echo Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

echo Symbolically link .zshrc to repo
rm -f $USER_DIR/.zshrc # Remove template added by oh-my-zsh
ln -s $PWD/.zshrc $USER_DIR/.zshrc
ln -s $PWD/.p10k.zsh $USER_DIR/.p10k.zsh

echo Install Powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# should be installed by homebrew automagically without TTY
# echo Install xcode CLT
# xcode-select --install

# Removes existing installation of xcode cli tools to allow homebrew to reinstall fresh
echo Remove Any Current Xcode CLI Tools Installation
sudo rm -rf /Library/Developer/CommandLineTools

echo Install Homebrew
which brew || /bin/bash -c "$(sudo curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" </dev/null

echo Install Homebrew Taps And Casks
brew bundle --verbose

echo Set iterm fonts to MesloLGS
defaults write com.apple.FontRegistry.user "Normal Font" "MesloLGS-NF-Regular 14"

echo Link Brew Java as JVM so that it is recognised by /usr/local/java_home
ln -s /usr/local/opt/openjdk/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk

echo Reload zsh using powerlevel config
$PWD/configure_zsh
