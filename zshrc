# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$PATH:/usr/local/go/bin:$HOME/go/bin:$HOME/.cargo/bin
export PATH=$PATH:$HOME/.npm-global/bin

export NODE_OPTIONS="--max_old_space_size=4096"

export PSQL_EDITOR=vim
export GIT_EDITOR=vim

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="spaceship"

LS_COLORS="ow=01;36;40" && export LS_COLORS

SPACESHIP_PROMPT_ORDER=(
  time          # Time stamps section
  user          # Username section
  dir           # Current directory section
  host          # Hostname section
  git           # Git section (git_branch + git_status)
  package       # Package version
  node          # Node.js section
  golang        # Go section
  rust          # Rust section
  aws           # Amazon Web Services section
  dotnet        # .NET section
  kubectl       # Kubectl context section
  terraform     # Terraform workspace section
  exec_time     # Execution time
  line_sep      # Line break
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)

plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
  docker
  npm
  node
  vscode
)

source $ZSH/oh-my-zsh.sh

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
fpath=($fpath "$HOME/.zfunctions")

# Set Spaceship ZSH as a prompt
autoload -U promptinit; promptinit
prompt spaceship

