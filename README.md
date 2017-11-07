# .dotfiles

## Installation

```
$ git clone https://github.com/mlvnt/.dotfiles.git ~/.dotfiles 
$ cd ~/.dotfiles
$ chmod +x setup.sh
$ ./setup.sh
```

## Remotely install using curl

Alternatively, you can install this into `~/dotfiles` remotely without Git using curl:

```sh
sh -c "`curl -fsSL https://raw.github.com/mlvnt/.dotfiles/master/wsl/setup.sh`"
```

Or, using wget:

```sh
sh -c "`wget -O - --no-check-certificate https://raw.githubusercontent.com/mlvnt/.dotfiles/master/wsl/setup.sh`"