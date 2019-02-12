

## FOR MAC

# xcode-select --install

# pyenv
git clone https://github.com/pyenv/pyenv.git ~/.pyenv

# prezto
zsh
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
chsh -s /bin/zsh
# 
# brew install lua
# brew reinstall vim --with-lua
# 
# brew install lua
# brew reinstall vim --with-lua

# Install NeoBundle
if [ -e ~/.vim/bundle ]; then
  echo [exists] NeoBundle
else
  echo [install] NeoBundle
  mkdir -p ~/.vim/bundle
  git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
fi
