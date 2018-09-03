# .dotfiles

This is a framework for management of my Linux configuration. It is self-contained, stored in the home folder `~/.dotfiles` and always ready for push of local changes to git. Its purpose is to simplify multidevice setup and usage. More info about dotfiles can be found on [ArchWiki][2]. Inspired by the [unofficial dotfiles guide project][1] and the countless kind people that shared their dotfiles. 

[1]: http://dotfiles.github.io/ "dotfiles.github.io"
[2]: https://wiki.archlinux.org/index.php/Dotfiles "Dotfiles"

## Installation

- **By Cloning**

```
setup() {
    git clone https://github.com/mlvnt/.dotfiles.git ~/.dotfiles 
    cd ~/.dotfiles
    chmod +x setup.sh
    ./setup.sh
}
setup
```
Alternatively, you can install this remotely without `git` using `curl` or `wget`:

- **Remotely using curl**

```bash
bash -c "`curl -fsSL https://raw.github.com/mlvnt/.dotfiles/master/wsl/setup.sh`"
```

- **Remotely using wget**

```bash
bash -c "`wget -O - --no-check-certificate https://raw.githubusercontent.com/mlvnt/.dotfiles/master/wsl/setup.sh`"
```

## Documentation

Coming soon...

## License

Copyright © 2017–2018 Malvin Todorov

Distributed under MIT License.