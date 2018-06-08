#!/bin/bash

set +e

start_date=`date +"%F %T"`

mkdir tmp

# Install Homebrew
echo "\n\n ------> Install Homebrew\n"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
echo "\n\n ------> Homebrew installed. :)\n\n"


# Install Homebrew-Cask
echo "\n\n ------> Install Homebrew-Cask\n"
brew tap homebrew/cask
echo "\n ------> Homebrew-Cask installed. :)\n\n"


# Install iTerm2
echo "\n\n ------> Install iTerm2\n"
curl https://iterm2.com/downloads/stable/iTerm2-*.zip -o ./tmp/iTerm2.zip
unzip iTerm2.zip
mv iTerm.app/ /Applications/
rm iTerm2.zip
echo "\n ------> iTerm2 installed. :)\n\n"


# Change shell to zsh and install oh-my-zsh
echo "\n\n ------> Install oh-my-zsh\n"
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
echo "\n ------> oh-my-zsh installed. :)\n\n"



# Install RVM (Ruby Version Manager)
echo "\n\n ------> Setup Ruby Env\n"
curl -sSL https://get.rvm.io | bash -s stable

# Upgrade to the latest RubyGems
gem update --system
echo "\n ------> Ruby Env done. :)\n\n"


end_date=`date +"%F %T"`

echo "\n[ Setup Dev Env for macOS Done :) ]"
echo "\n[ Run \"$0\" Done. $start_date ~ $end_date ]"

set -e
