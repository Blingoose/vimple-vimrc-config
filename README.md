# vimple-vimrc-config
Vim and Simple = Vimple. 
I'm passionate about pure Vim with a simple yet useful IDE like experience that's actually Working.Stable.Head-Ache-Less. 
This is it.

Preparation:
1) Download Vim (Not Neovim).
2) Download Node.
3) Create the necessary directories in your $HOME directory --> mkdir -p ~/.vim ~/.vim/autoload ~/.vim/backup ~/.vim/plugged
4) Download and install Vim Plug. https://github.com/junegunn/vim-plug
5) Copy my .vimrc (or parts from it) to your $HOME directory
6) Run vim, ignore the errors and Enter --> :PlugInstall
7) Quit & Open vim again.
8) Configure my .vimrc for your style.
9) Have fun & keep it simple.

Using Coc for completion plugin:
I have provided #coc-settings.json# with a simple configuration mainly for python and web-dev.
If you want to have the same formatting & linting as in the file - you need to download a few python packages:
1) pip install black (formatter)
2) pip install autopep8 (formatter)
3) pip install pylint (linter)
4) I also encourge you to download flake8: pip install flake8 (linter)

** coc-settings.json must be placed in ~/.vim. (Home folder > .vim/*put it here*)

Now inside Vim Enter -->  :CocInstall coc-json coc-vimlsp coc-pyright coc-tsserver coc-eslint
Visit Coc.nvim repository for more info: https://github.com/neoclide/coc.nvim

You can edit coc-settings.json inside vim, use the following command --> :CocConfig
