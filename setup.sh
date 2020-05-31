#!/bin/bash

ZSH=${ZSH:-~/.oh-my-zsh}

add_package_sources() {
  # Add the Cloud SDK distribution URI as a package source
  echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] http://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
  curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
}

install_essentials() {
  sudo apt-get update
  sudo apt-get -y upgrade
  sudo apt-get -y install curl git build-essential
}

setup_zsh_prompt() {
  # Install OH MY ZSH
  sudo apt-get -y install zsh
  RUNZSH=no sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

  # Install Spaceship Prompt
  git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH/themes/spaceship-prompt"
  ln -s "$ZSH/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH/themes/spaceship.zsh-theme"

  # Install ZSH Plugins
  git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH/plugins/zsh-autosuggestions
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH/plugins/zsh-syntax-highlighting
  cp zshrc ~/.zshrc
}

setup_vim() {
  sudo apt-get -y install vim
  git clone https://github.com/braintreeps/vim_dotfiles.git ~/.vim
  ./$HOME/.vim/activate.sh
}

setup_node() {
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash

  sudo bash ~/.nvm/nvm.sh
  nvm install --lts
}

setup_gcp() {
  sudo apt-get -y install google-cloud-sdk
  gcloud init
}

setup_firebase() {
  npm install -g firebase-tools
  firebase init
}

main() {
  add_package_sources
  install_essentials
  setup_vim
  
  setup_zsh_prompt
  setup_node

  # setup_firebase
  # setup_gcp
}

main "$@"