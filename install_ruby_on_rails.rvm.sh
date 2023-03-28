#!/bin/bash

DEFAULTY_RUBY_VERSION=3.0.0

echo !!! Installing macos dependencies for Ruby on Rails
brew bundle install --file Brewfile.rvm_rails

echo !!! Installing keys for gpg
gpg --keyserver hkp://keyserver.ubuntu.com --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB

echo !!! Installing RVM with default rails
curl -sSL https://get.rvm.io | bash -s stable --rails
echo !!! Sourcing RVM into current shell
source /Users/felixmarcusmillne/.rvm/scripts/rvm

echo !!! Installing latest Ruby version
rvm install ruby --latest

echo !!! Installing Ruby version 2.7
rvm install 2.7

echo "!!! Installing Ruby version $DEFAULT_RUBY_VERSION"
rvm install "$DEFAULT_RUBY_VERSION"
rvm docs generate-ri

echo !!! Setting RVM Default Ruby version to 3.0.0
rvm --default use $DEFAULT_RUBY_VERSION

echo !!! List of currenty RVM Ruby versions available
rvm list

