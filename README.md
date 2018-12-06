
```text

         ██            ██     ████ ██  ██
        ░██           ░██    ░██░ ░░  ░██
        ░██  ██████  ██████ ██████ ██ ░██  █████   ██████
     ██████ ██░░░░██░░░██░ ░░░██░ ░██ ░██ ██░░░██ ██░░░░
    ██░░░██░██   ░██  ░██    ░██  ░██ ░██░███████░░█████
 ██░██  ░██░██   ░██  ░██    ░██  ░██ ░██░██░░░░  ░░░░░██
░██░░██████░░██████   ░░██   ░██  ░██ ███░░██████ ██████
░░  ░░░░░░  ░░░░░░     ░░    ░░   ░░ ░░░  ░░░░░░ ░░░░░░
```

A self-contained, versioned framework managing my Linux configuration stored in `~/.dotfiles`. It aims to simplify the setup and usage of multiple devices by committing any changes to git. More about dotfiles can be found on [ArchWiki][2].

[1]: http://dotfiles.github.io/ "dotfiles.github.io"
[2]: https://wiki.archlinux.org/index.php/Dotfiles "Dotfiles"

## Installation

* By Cloning

    ```bash
    setup() {
        git clone https://github.com/mlvnt/.dotfiles.git ~/.dotfiles
        cd ~/.dotfiles
        chmod +x setup.sh
        ./setup.sh
    }
    setup
    ```

* Alternatively, you can install this remotely without `git` using `curl` or `wget`:

  * **curl**

      ```bash
      bash -c "`curl -fsSL https://raw.github.com/mlvnt/. dotfiles/master/wsl/setup.sh`"
      ```

  * **wget**

      ```bash
      bash -c "`wget -O - --no-check-certificate https://raw.githubusercontent.com/mlvnt/.  dotfiles/master/wsl/setup.sh`"
      ```

## Documentation

Coming soon...

## Inspiration / Credits

* [the unofficial dotfiles guide project][1]
* [figlet / toilet fonts](https://github.com/xero/figlet-fonts)
* many kind people that shared their dotfiles (Coming soon...)

## License

Copyright © 2017–2018 Malvin Todorov

Distributed under MIT License.
