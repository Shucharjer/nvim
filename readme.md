[简体中文](readme_zh.md) | Engligh

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
