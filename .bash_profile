# ENV
export PS1="\W \$: "
export SVN_EDITOR=vim
export PATH="/usr/local/bin":"/usr/local/mysql/bin":$PATH

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# alias
alias ll='ls -lG'
alias la='ls -laG'
alias ls='ls -G'
alias rr='svn revert . --depth infinity'
alias st='svn st -u'
alias gs='git status'
alias gl='git log --name-status'
alias gc='git commit'
alias ga='git add'
alias gb='git branch'
alias g='git'
alias c='clear'
alias s='svn'
alias sl='svn log | less'
alias slv='svn log -v | less'
alias xcode='open /Applications/Xcode.app'
alias py='python'
alias web='python -m SimpleHTTPServer'
alias startapache='sudo /Applications/XAMPP/xamppfiles/xampp startapache'
