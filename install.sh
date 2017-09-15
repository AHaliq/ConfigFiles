BASEDIR=$(cd $(dirname "$0") && pwd -P)

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
ln -s "$BASEDIR/.vimrc" ~/.vimrc
ln -s "$BASEDIR/.extend.vim" ~/.extend.vim
ln -s "$BASEDIR/.zshrc" ~/.zshrc
ln -s "$BASEDIR/.tmux.conf" ~/.tmux.conf
