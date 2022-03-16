# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git macos docker)

source $ZSH/oh-my-zsh.sh

# User configuration
if [[ `uname -m` == 'arm64' ]]; then
	HOMEBREW_BASE_DIR="/opt/homebrew"
else
	HOMEBREW_BASE_DIR="/usr/local"
fi
source $HOMEBREW_BASE_DIR/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
export PATH="$HOMEBREW_BASE_DIR/bin:$PATH"
export PATH="./node_modules/.bin:$PATH"
export PATH="$HOME/.bin:$PATH"
export PATH="$HOME/.nodebrew/current/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="./vendor/bin:$PATH"
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi
export EDITOR='vim'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias zshconfig="vim ~/.zshrc"
alias sshconfig="vim ~/.ssh/config"
alias ohmyzsh="vim ~/.oh-my-zsh"
alias c="clear"
alias xcodeclean="rm -frd ~/Library/Developer/Xcode/DerivedData/* && rm -frd ~/Library/Caches/com.apple.dt.Xcode/*"
alias gsd="git switch develop"
alias be='bundle exec'
alias ggpusf='git push --force-with-lease -u origin "$(git_current_branch)"'
alias ggpushf='git push --force-with-lease -u origin "$(git_current_branch)"'
alias g='cd $(ghq root)/$(ghq list | fzf)'
alias b='hub browse $(ghq list | fzf | cut -d "/" -f 2,3)'
alias v='code $(ghq root)/$(ghq list | fzf)'
alias i='idea $(ghq root)/$(ghq list | fzf)'
alias killj="ps -e | grep JapaneseIM | grep -v grep | awk '{print \$1}' | xargs -I{} kill -9 {}"
alias k='kubectl'
alias kn='kubens'
alias kc='kubectx'
alias ko='kubeon'
alias kof='kubeoff'
alias cdr='cd `git rev-parse --show-toplevel`'
alias ls='lsd'
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'
alias gbdac='gbda && git prune && git gc'
alias ghview='gh repo view -w'

# rbenv
eval "$(rbenv init - zsh)"

# direnv
eval "$(direnv hook zsh)"


# .zshrc.local
[ -f ~/.zshrc.local ] && source ~/.zshrc.local


# Golang
export GOPATH=$HOME
export PATH="$GOROOT/bin:$PATH"
export PATH="$GOPATH/bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f /usr/local/opt/google-cloud-sdk/path.zsh.inc ]; then
	source '/usr/local/opt/google-cloud-sdk/path.zsh.inc'
fi
if [ -f /opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc ]; then
	source '/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'
fi

# The next line enables shell command completion for gcloud.
if [ -f /usr/local/opt/google-cloud-sdk/completion.zsh.inc ]; then
	source '/usr/local/opt/google-cloud-sdk/completion.zsh.inc'
fi
if [ -f /opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc ]; then
	source '/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'
fi

# Kubectl Autocomplete lazy load
function kubectl() {
	if ! type __start_kubectl >/dev/null 2>&1; then
		source <(command kubectl completion zsh)
	fi
	command kubectl "$@"
}

# java
export JAVA_HOME=`/usr/libexec/java_home -v 11`
export PATH="$JAVA_HOME/bin:$PATH"

# kube-ps1
source "$HOMEBREW_BASE_DIR/opt/kube-ps1/share/kube-ps1.sh"
PROMPT='$(kube_ps1)'$PROMPT

# krew
export PATH="${PATH}:${HOME}/.krew/bin"

# zprof
if (which zprof > /dev/null) ;then
  zprof | less
fi

# fzf
wd() {
  local dir
  dir=$(/bin/ls $HOME/work | fzf)
  cd "$HOME/work/$dir"
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# git switch master or main
gsm() {
	if [ "$(git branch | grep master)" ]; then
		git switch master
	else
		git switch main
	fi
}

# homebrew 
eval "$($HOMEBREW_BASE_DIR/bin/brew shellenv)"

# asdf
. $(brew --prefix asdf)/libexec/asdf.sh

eval "$(/opt/homebrew/bin/brew shellenv)"
