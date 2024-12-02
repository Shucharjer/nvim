#### Setup

##### On Windows

###### 安装Chocolatey

Chocolatey是一个支持Windows的包管理工具，能方便地安装一系列软件包

```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
```

###### 使用Chocolatey安装neovim, neovide

**这一步骤建议在管理员身份下执行(可以按Win+X, A)**

```powershell
choco install -y python3 nodejs doxygen.install luarocks ripgrep tree-sitter yazi neovim neovide
```

###### 安装python和nodejs中nvim的包

```powershell
pip3 install neovim
npm install -g neovim
```

###### 克隆配置仓库

```powershell
cd ~/AppData/Local
git clone https://github.com/Shucharjer/nvim.git
```

######  还有一件事

打开nvim或neovide，等待下载插件和语言服务提供程序