# Vimrc
![Vimrc](https://github.com/abdoulayegk/Dotefiles/blob/main/nvimcpp.png)
To make this work follow these steps for linux users
The awesome version includes a lot of great plugins, configurations and color schemes that make Vim a lot better.

1 To install it simply do following from your terminal:

``` bash
  git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime sh ~/.vim_runtime/install_awesome_vimrc.sh.
  ```
  2- Find your vimrc file by just using this command: vim ~./vimrc if it doesn't exit then you should create it.
  3- Copy the content of the vimrc.txt and paste into the .vimrc
  4- Save and reload your vimrc by using these commands: :w ==> to save then : source ~/.vimrc
  
  I ended up add more useful plugin which for you to be able to do so follow these steps:
  paste the following code to your terminal: 
1. Install to ~/.vim/autoload/pathogen.vim. Or copy and paste the following into your terminal/shell:

```bash
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
```
3. You would need to install black for python formating:
cd .vim/bundle then do paste this command:
```bash
git clone git@github.com:psf/black.git
```
If you're using Windows, change all occurrences of ~/.vim to ~\vimfiles.
2. Add this to your vimrc:
execute pathogen#infect()
syntax on
filetype plugin indent on
3. After this you can install balck which is a python code formater that can fix your linting error:
Do simply the following: cd .vim/bundle then paste this into your terminal:git clone https://github.com/psf/black.git
4. save and ext now whenever you open with it will create a virtual envirnement and install black for you. you only need to copy things from my vimrc as your own convinient.

This is inspired by Amix

when you update this repo you might get this warning: The legacy Snopmate parser is deprecated. Please see : h SnipMate-deprecate.
Add the following in your vimrc file: let g:snipMate = { 'snippet_version' : 1 }
This will most probably fix the issue.



