function install_brew {
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew install caskroom/cask/brew-cask
}

function terminal_install {
  brew install zsh
  # sudo -s
  # echo $(which zsh) >> /etc/shells
  # exit
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
  git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

  brew install fzf
  # install shell extenstions
  /usr/local/opt/fzf/install

  brew cask install iterm2
}

function themes {
  git clone https://github.com/powerline/fonts.git
  ./fonts/.install.sh
  echo "Power line install done!"
}

function dev_tools {
  brew install git
  brew install vim --override-system-vim
  brew install tmux
  curl -fsSL https://raw.github.com/mislav/dotfiles/1500cd2/bin/tmux-vim-select-pane \
    -o /usr/local/bin/tmux-vim-select-pane
  chmod +x /usr/local/bin/tmux-vim-select-pane
}

function web_dev {
  brew install rbenv ruby-build

  # Add rbenv to bash so that it loads every time you open a terminal
  echo 'if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi' >> ~/.zshrc
  source ~/.zshrc

  # Install Ruby
  rbenv install 2.4.0
  rbenv global 2.4.0
  ruby -v

  gem install rails -v 5.0.1
  rbenv rehash

  brew install mysql
  ln -sfv /usr/local/opt/mysql/*plist ~/Library/LaunchAgents
  launchctl load ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist
}

function programs {
  brew cask install google-chrome
  brew cask install firefox
  brew cask install dropbox
  brew cask install vlc

}

# install_brew
terminal_install
themes
dev_tools
web_dev
