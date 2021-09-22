#!/bin/sh

# oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# homebrew for m1 mac
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ./.zshrc
eval "$(/opt/homebrew/bin/brew shellenv)"

DIR=$(cd $(dirname $0); pwd)

for f in .??*
do
  [[ "$f" == ".git" ]] && continue
  [[ "$f" == ".gitignore" ]] && continue
  [[ "$f" == ".DS_Store" ]] && continue

  echo "$f"
  rm ~/$f
  ln -sf $DIR/$f ~/$f
done

chsh -s "$(which zsh)"

# dein.vim
mkdir -p $HOME/.vim/bundles
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > /tmp/installer.sh
sh /tmp/installer.sh $HOME/.vim/bundles

