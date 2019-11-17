```text

                                              ██            ██
                                             ░██           ░██
                             ██████████      ░██  ██████  ██████  ██████
                            ░░██░░██░░██  ██████ ██░░░░██░░░██░  ██░░░░
                             ░██ ░██ ░██ ██░░░██░██   ░██  ░██  ░░█████
                             ░██ ░██ ░██░██  ░██░██   ░██  ░██   ░░░░░██
                             ███ ░██ ░██░░██████░░██████   ░░██  ██████
                            ░░░  ░░  ░░  ░░░░░░  ░░░░░░     ░░  ░░░░░░
```

<p align="center">
    <a href="http://unmaintained.tech/"><img alt="status: alpha" src="assets/badges/status-alpha-red.svg"></a>
    <a href="https://www.python.org/"><img alt="python: 3.7" src="assets/badges/python-3.7-green.svg"></a>
    <a href="https://www.gnu.org/software/bash/"><img alt="bash: 5.0.11" src="assets/badges/bash-5.0.11-green.svg"></a>
    <a href="https://www.zsh.org/"><img alt="zsh: 5.7.1" src="assets/badges/zsh-5.7.1-green.svg"></a>
    <a href="https://www.gnu.org/licenses/agpl-3.0.html"><img alt="license: agpl" src="assets/badges/license-agpl-green.svg"></a>
</p>

A self-contained framework for managing multi-os configuration. Named after a common place for storing linux configuration files (`~/.dotfiles`). It aims to:

- simplify and automate the setup and usage of multiple devices and introducing shared data model
  - easy and reliable way to share files (`syncthing`)
  - track changes (`git`)
  - create an open and transparent environment for managing all life activities by utilizing the shared data model
- make a true cross-platform experience where all data belongs to you and you understand where and how it is used
  - use efficient way of redundancy and eliminate the need of manual data backups
- create a modular system where each component is as minimal as possible thus enabling it to become extensible and scalable on-demand
  - minimize the amount of dependencies
  - no legacy components
- be a system you understand, and be as user-friendly as possible - suitable for both developers and casual users
  - this can be achieved by having a variety of intuitive user interfaces ([CLI][3], [TUI][4], [GUI][5]) and a good documentation
- not reinvent the wheel

None of these aims are set in stone and will be updated accordingly. When a component is mature enough it will be moved to a separate repository.

# contents

- [design](#design)
  - [i. initial setup](#i-initial-setup)
  - [ii. user configuration](#ii-user-configuration)
  - [iii. linking](#iii-linking)
- [installation](#installation)
- [timeline](#timeline)
- [changelog](#changelog)
- [documentation](#documentation)
- [inspiration and credits](#inspiration-and-credits)
  - [interesting reads](#interesting-reads)
  - [projects](#projects)
- [license](#license)

## design

Current prototype:

### i. initial setup

Set the system up from `./setup`. This includes:

- initialize framework core
  - shared data structures manager
  - utilities
  - maintenance
    - update manager
    - symblink manager
  - integrated documentation
- set platform-dependent structure and tools
  - install and update apps
  - set up shell and synchronization (`git`, `syncthing`)
- way to configure the process
  - command-line flags
  - configuration file/files
  - the default configuration is stored in `./config`

### ii. user configuration

After we have the basic system up and running its time for user configuration. It should be seamless and reflect the changes the user makes between machines without any interaction. While `git` or any other VSC may be great for distributing the initial `./setup` it lacks versatility. The perfect fit for our job is [`syncthing`][6]. It provides a quick, secure and continuous file synchronization while still having decent version control. Another benefit is that you don't share it publicly and thus you won't share accidentally sensitive information.

For this purpose, any user configuration is stored in a single or multiple folders synchronized with [`syncthing`][6] between the different systems. In this way, we achieve system (includes the framework core) and user data separation. If the system fails or gets corrupted the user data is left intact and the same holds the other way around. The system component is backed up with `git` and the user data with [`syncthing`][6]. (TODO: add a diagram)

### iii. linking

Now that we have both a working system and the user configuration on the target device is time to apply it. To avoid any duplication we'll be using a symblink manager. A popular one is [`gnu stow`](https://www.gnu.org/software/stow/) but why add more dependencies? The framework will ship with a minimal alternative. With it, we'll create symbolic links from the synchronized user configuration to its original destination. This process will again be automated by adding the desired configuration to `./config`.

## installation

- by cloning

    ```bash
    setup() {
        git clone https://github.com/mlvnt/.dotfiles.git ~/.dotfiles
        cd ~/.dotfiles
        chmod +x setup.sh
        ./setup.sh
    }
    setup
    ```

- alternatively, you can install this remotely without `git` using `curl` or `wget`:

  - **curl**

      ```bash
      bash -c "`curl -fsSL https://raw.github.com/mlvnt/. dotfiles/master/setup/setup.sh`"
      ```

  - **wget**

      ```bash
      bash -c "`wget -O - --no-check-certificate https://raw.githubusercontent.com/mlvnt/.  dotfiles/master/setup/setup.sh`"
      ```

## timeline

Coming soon...

## changelog

Coming soon...

## documentation

Coming soon...

## inspiration and credits

### interesting reads

- [Reinventing Home Directories - Lennart Poettering](https://www.youtube.com/watch?v=ZwjzfdLJtX4)

### projects

- badges
  - [shields.io](https://shields.io/)
- dotfiles
  - [archwiki][2]
  - [the unofficial dotfiles guide project][1]
  - many kind people that shared their dotfiles (Coming soon...)
- bash and bash frameworks
  - [awesome-lists/awesome-bash](https://github.com/awesome-lists/awesome-bash)
  - [bash-it](https://github.com/Bash-it/bash-it)
- theming
  - [figlet/toilet fonts](https://github.com/xero/figlet-fonts)
- zsh frameworks
  - [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)

## license

Copyright &copy; 2017–2019 Malvin Todorov

Distributed under The GNU Affero General Public License v3 (GNU AGPL)

[1]: http://dotfiles.github.io/ "dotfiles.github.io"
[2]: https://wiki.archlinux.org/index.php/Dotfiles
[3]: https://en.wikipedia.org/wiki/Command-line_interface "Command-line interface"
[4]: https://en.wikipedia.org/wiki/Text-based_user_interface "Text-based user interface"
[5]: https://en.wikipedia.org/wiki/Graphical_user_interface "Graphical user interface"
[6]: https://syncthing.net/
