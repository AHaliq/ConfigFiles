BASEDIR=$(cd $(dirname "$0") && pwd -P)

ln -s "$BASEDIR/.vimrc" ~/.vimrc
ln -s "$BASEDIR/.extend.vim" ~/.extend.vim
ln -s "$BASEDIR/.zshrc" ~/.zshrc
ln -s "$BASEDIR/.tmux.conf" ~/.tmux.conf
