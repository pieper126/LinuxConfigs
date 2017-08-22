#!/bin/bash -x
echo start installing rbenv
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
cd ~/.rbenv && src/configure && make -C src
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
 ~/.rbenv/bin/rbenv init
 git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
 source ~/.bashrc
 rbenv install 2.3.3
 rbenv rehash
 rbenv global 2.3.3
 gem install bundler
 echo end
