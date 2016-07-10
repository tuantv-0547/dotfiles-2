#!/bin/bash

function update {
  sudo apt-get update
  sudo apt-get install curl
}

# Install zsh and oh-my-zsh
function install_zsh {
  echo "Installing zsh and oh-my-zsh..."
  sudo apt-get install zsh
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
  sudo chsh -s /usr/bin/zsh
  git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
  git clone https://github.com/powerline/fonts.git
  ~/fonts/.install.sh
  echo "Powerline fonts was installed. Please change font on terminal setting!!!"
}

# Install vim and tmux
function install_vim_and_tmux {
  echo "Installing tmux and vim."
  sudo apt-get install vim
  sudo apt-get install tmux
}

# Download .dotfile and install
function config_dotfile {
  echo "Config dotfile "
  git clone https://github.com/ttuan/dotfile.git
  cp dotfile/vimrc ~/.vimrc
  vim +PluginInstall +qall
  cp dotfile/getSongName.sh ~/getSongName.sh
  cp dotfile/zsh ~/.zsh
  cp dotfile/vimperatorrc ~/.vimperatorrc
  cp dotfile/tmux.conf ~/.tmux.conf
  export EDITOR='vim'
  cp dotfile/project.yml ~/.tmuxinator/

  cd ~/.vim/bundle/YouCompleteMe
  ./install.py --clang-completer
}

# Install git and config
function install_git {
  echo "Install git and setup"
  sudo apt-get install git
  git config --global color.ui true
  git config --global user.name "ttuan"
  git config --global user.email "tuantv.nhnd@gmail.com"
  ssh-keygen -t rsa -b 4096 -C "tuantv.nhnd@gmail.com"

  git config --global alias.co checkout
  git config --global alias.br branch
  git config --global alias.ci commit
  git config --global alias.st status
}


# Install for web dev
function install_ruby_on_rails {
  echo "Installing ruby and rails"
  sudo apt-get update
  sudo apt-get install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev

  sudo apt-get install libgdbm-dev libncurses5-dev automake libtool bison libffi-dev
  gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
  curl -sSL https://get.rvm.io | bash -s stable
  source ~/.rvm/scripts/rvm
  rvm install 2.3.1
  rvm use 2.3.1 --default
  ruby -v
  gem update --system
  echo "gem: --no-document" >> ~/.gemrc
  gem install bundler

  echo "Install mysql"
  sudo apt-get install mysql-server mysql-client libmysqlclient-dev

  gem install nokogiri
  gem install tmuxinator
  sudo apt-get install nodejs
  "Done! Rails 5 is not installed."
}

function programs {
  sudo apt-get install guake
}

update
install_zsh
config_dotfile
install_vim_and_tmux
install_git
install_ruby_on_rails
programs