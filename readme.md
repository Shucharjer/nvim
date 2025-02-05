[简体中文](readme_zh.md) | Engligh

<div style="text-align: center;">
    <a href="https://wakatime.com/badge/user/c2bf5fd3-fa11-40bd-95ed-8665146ffa80/project/5cf9ad50-181c-4ef6-8e34-39a1f853c170">
        <img src="https://wakatime.com/badge/user/c2bf5fd3-fa11-40bd-95ed-8665146ffa80/project/5cf9ad50-181c-4ef6-8e34-39a1f853c170.svg" alt="wakatime">
    </a>
</div>

#### Intro

##### Appearance

This nvim configuration is mainly for transparent terminals, which means that the effect may look worse in opaque terminals.

##### Features

Probably no features, but there is some features.

- Pure
  Compared with other nvim configuration files, it is relatively pure.
- vscode-like foreground
- Ongoing maintenance

#### Setup

##### On Unix

###### Install neovim&neovide by you local package manager

Up to your os or in an other word, package manager.

###### Install package for python&node

Up to your os or in an other word, package manager.

###### Clone this repo

```powershell
cd ~/AppData/Local
git clone https://github.com/Shucharjer/nvim.git
```

###### One more thing

Open your nvim (or neovide), waiting for downloading.

##### On Windows

###### Install Chocolatey

Chocolatey is a package managment tool for Windows.

```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
```

###### Install neovim&neovide by Chocolatey

**Do this in Administrator. (You could press key `Win+X`, `A`)**

```powershell
choco install -y python3 nodejs doxygen.install luarocks ripgrep tree-sitter yazi neovim neovide
```

###### Install package in python&nodejs

```powershell
pip3 install neovim
npm install -g neovim
```

###### Clone this repo

```powershell
cd ~/AppData/Local
git clone https://github.com/Shucharjer/nvim.git
```

###### One more thing

Open your nvim (or neovide), waiting for downloading.
