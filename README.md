
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

A self-contained framework for managing multi-os configuration. Named after a common place for storing Linux application configuration (`~/.dotfiles`) until a better name is given. It aims to:

- simplify and automate the setup and usage of multiple devices by tracking changes using git and introducing shared data model
- create an open environment for managing all life activities by utilizing the shared data model
- make a true cross-platform experience where all data belongs to you and you understand where and how it is used
- create a modular system where each component is as minimal as possible thus enabling it to become extensible and scalable on-demand
- be a system you understand, and be as user-friendly as possible - suitable for both developers and casual users
  - this can be achieved by having a variety of intuitive user interfaces ([CLI][3], [TUI][4], [GUI][5]) and a good documentation
- not reinvent the wheel

None of these aims are set in stone and will be updated accordingly. When a component is mature enough it will be moved to a separate repository.

## Installation

> Breaking Changes: The project is ongoing complete overhaul and is not recommended for installation. Some of the major changes include a new management framework similar to [bash-it](https://github.com/Bash-it/bash-it) that will soon be released as separate Python package, project structure revamp, multiple fixes and automations and more...

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
      bash -c "`curl -fsSL https://raw.github.com/mlvnt/. dotfiles/master/setup/setup.sh`"
      ```

  * **wget**

      ```bash
      bash -c "`wget -O - --no-check-certificate https://raw.githubusercontent.com/mlvnt/.  dotfiles/master/setup/setup.sh`"
      ```

## Timeline

Coming soon...

## Changelog

Coming soon...

## Documentation

Coming soon...

## Inspiration and Credits

* dotfiles:
  * [archwiki][2]
  * [the unofficial dotfiles guide project][1]
  * many kind people that shared their dotfiles (Coming soon...)
* bash frameworks:
  * [bash-it](https://github.com/Bash-it/bash-it)
* zsh frameworks:
  * [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)
* theming
  * [figlet/toilet fonts](https://github.com/xero/figlet-fonts)

## License

Copyright © 2017–2019 Malvin Todorov

Distributed under The GNU Affero General Public License.

[1]: http://dotfiles.github.io/ "dotfiles.github.io"
[2]: https://wiki.archlinux.org/index.php/Dotfiles
[3]: https://en.wikipedia.org/wiki/Command-line_interface "Command-line interface"
[4]: https://en.wikipedia.org/wiki/Text-based_user_interface "Text-based user interface"
[5]: https://en.wikipedia.org/wiki/Graphical_user_interface "Graphical user interface"
