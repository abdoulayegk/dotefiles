# My linux config files
![vimrc](https://github.com/abdoulayegk/dotefiles/blob/main/vimrcimg1.png)
![Vimrc](https://github.com/abdoulayegk/dotefiles/blob/main/pythonimg.png)
## Requirements

- Linux (not tested on other platforms)
- Neovim (you can try regular Vim)
- Properly set up environment

## Setup

To check if your current environment is correctly set up run `:CheckHealth`.

### Environment

- python3: `pip3 install --user pynvim`
- javascript: `yarn global add neovim`
- on arch for C and C++: ` sudo pacman -S clangd`
- If you get error everytime you open neoim run this `pip3 install neovim`

- To install my config just clone the repo and then open nvim

1. Noevim

```bash
git clone git@github.com:abdoulayegk/dotefiles.git
```
Then cd in the the directory type this command:
```bash
cd dotefiles
```
<span> Note</span> You only need to install neovim and put the init.vim into this direcotry<br/>
 ```bash
  mv init.vim ~/.config/nvim
 ```
 That's all you then open neovim  and press <span>Enter </span> everything will get installed then enjoy nvim.
  
### Feel free to create and issue if you find anything wired or face some problem. <br>
  
Feel free to open the init.vim and read about the key bindings that i have.
  
#### Essentials

| Mapping      | functionality                        |
| ------------ | ------------------------------------ |
| `F9`          | Run code python,c&cpp key           |
| `,`          | leader key                           |
| `leader + q` | close                                |
| `leader + w` | save changes                         |
| `leader + f` |  fizzy found using Telescope         |                    
| `jj`         | equivalent to Esc                    |

<span> You init.vim must be in this directory then only it will work: `$Home/.config/nvim`
