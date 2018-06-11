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
plugins=(git osx web-search docker gem npm)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH="/usr/local/bin:$PATH"
export PATH="./node_modules/.bin:$PATH"
export PATH="$HOME/.bin:$PATH"
export PATH="$HOME/.nodebrew/current/bin:$PATH"
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
alias xcode="open /Applications/Xcode.app/"
alias xcodeclean="rm -frd ~/Library/Developer/Xcode/DerivedData/* && rm -frd ~/Library/Caches/com.apple.dt.Xcode/*"
alias gcd="git checkout develop"
alias brwe='brew'
alias be='bundle exec'
alias ggpusf='git push --force-with-lease -u origin'
alias ggpushf='git push --force-with-lease -u origin'
alias g='cd $(ghq root)/$(ghq list | peco)'
alias b='hub browse $(ghq list | peco | cut -d "/" -f 2,3)'
alias v='code $(ghq root)/$(ghq list | peco)'
alias a='atom $(ghq root)/$(ghq list | peco)'
alias killj="ps -e | grep JapaneseIM | grep -v grep | awk '{print \$1}' | xargs -I{} kill -9 {}"
alias k='kubectl'
alias kn='kubens'
alias gh='hub browse'

# rbenv
eval "$(rbenv init - zsh)"

# direnv
eval "$(direnv hook zsh)"


# .zshrc.local
[ -f ~/.zshrc.local ] && source ~/.zshrc.local


# Golang
export GOPATH=$HOME
export PATH="$GOPATH/bin:$PATH"

# peco
function peco-history-selection() {
  BUFFER=`fc -nl 1 | tail -r  | awk '!a[$0]++' | peco`
  CURSOR=$#BUFFER
  zle reset-prompt
}
zle -N peco-history-selection
bindkey '^R' peco-history-selection

# The next line updates PATH for the Google Cloud SDK.
if [ -f /usr/local/opt/google-cloud-sdk/path.zsh.inc ]; then
  source '/usr/local/opt/google-cloud-sdk/path.zsh.inc'
fi

# The next line enables shell command completion for gcloud.
if [ -f /usr/local/opt/google-cloud-sdk/completion.zsh.inc ]; then
  source '/usr/local/opt/google-cloud-sdk/completion.zsh.inc'
fi

# Kubectl Autocomplete
source <(kubectl completion zsh)  # setup autocomplete in zsh

# sbt
export PATH="${HOME}/.sbtenv/bin:${PATH}"
eval "$(sbtenv init -)"

# visual studio code
code () { VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $* ;}

# java
export JAVA_HOME=`/usr/libexec/java_home -v 1.8`
export PATH=$JAVA_HOME/bin:$PATH

# kube-ps1
source "/usr/local/opt/kube-ps1/share/kube-ps1.sh"
PROMPT='$(kube_ps1)'$PROMPT

