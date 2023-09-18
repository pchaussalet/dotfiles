setopt auto_cd
setopt auto_menu
setopt extended_history
setopt append_history

if [ `uname` = "Darwin" ]; then
  IS_DARWIN=1
fi

if [ `uname` = "Linux" ]; then
  IS_LINUX=1
fi

if [ ! -d ${HOME}/.zgen ]; then
  git clone https://github.com/tarjoilija/zgen.git "${HOME}/.zgen"
fi

source "${HOME}/.zgen/zgen.zsh"

if ! zgen saved; then

  # plugins
  zgen load unixorn/autoupdate-zgen
  zgen oh-my-zsh
  zgen oh-my-zsh plugins/dotenv
  zgen oh-my-zsh plugins/git
  zgen oh-my-zsh plugins/sudo
  zgen oh-my-zsh plugins/command-not-found
  zgen oh-my-zsh plugins/brew
  zgen oh-my-zsh plugins/sudo
  zgen oh-my-zsh plugins/gradle
  zgen oh-my-zsh plugins/history
  zgen oh-my-zsh plugins/docker
  zgen oh-my-zsh plugins/nvm
  zgen oh-my-zsh plugins/npm
  zgen oh-my-zsh plugins/node
  zgen load chrissicool/zsh-256color

  # theme
  zgen load NelsonBrandao/absolute absolute

  if [ "${IS_DARWIN}" = "1" ]; then
    zgen oh-my-zsh plugins/macos
  fi

  zgen save
fi
ZGEN_PLUGIN_UPDATE_DAYS=1

export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

export NODE_OPTIONS="--max-old-space-size=8192"

alias idea.="idea ."

function find_in_gradle_cache () {
    find ~/.gradle/caches -name $1
}

function remove_from_gradle_cache () {
    find ~/.gradle/caches -name $1 | xargs rm -rfv 
}

alias git_prune_branches='for branch in $(git branch --format "%(refname:short) %(upstream) %(upstream:track)" |grep '\[gone\]$' |awk '{print $1}'); do git branch -D $branch; done'

if [ -f .zshrc.local ]; then
  source .zshrc.local
fi
