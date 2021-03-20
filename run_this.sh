#!/usr/bin/env bash

#Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

#Install Powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

#Symbolically link .zshrc to repo
ln -s $PWD/.zshrc /Users/$USER/.zshrc
ln -s $PWD/.p10k.zsh /Users/$USER/.p10k.zsh

#Install xcode CLT
xcode-select --install

# Install Homebrew, Taps And Casks
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew bundle

# Link Brew Java as JVM so that it is recognised by /usr/local/java_home
ln -s /usr/local/opt/openjdk/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk

#Reload zsh using powerlevel config
source ~/.zshrc
