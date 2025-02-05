[English](readme.md) | 简体中文

<div style="text-align: center;">
    <a href="https://wakatime.com/badge/user/c2bf5fd3-fa11-40bd-95ed-8665146ffa80/project/5cf9ad50-181c-4ef6-8e34-39a1f853c170">
        <img src="https://wakatime.com/badge/user/c2bf5fd3-fa11-40bd-95ed-8665146ffa80/project/5cf9ad50-181c-4ef6-8e34-39a1f853c170.svg" alt="wakatime">
    </a>
</div>

#### 介绍

##### 外观

这个nvim的配置主要是针对透明终端的，这意味着在不透明的终端中看起来效果可能会比较差.

##### 特色

可能没什么特色, 但也有特色.

- 纯粹
  相比起其它nvim的配置文件来说，它是比较纯粹的
- vscode风格的前景色
- 持续维护

#### 启动

##### Unix

###### 通过你的包管理器安装neovim&neovide

取决于你的系统或者包管理器.

###### 安装python和node包

取决于你的系统或者包管理器.

###### 克隆配置仓库

```powershell
cd ~/AppData/Local
git clone https://github.com/Shucharjer/nvim.git
```

###### 还有一件事

打开nvim或neovide，等待下载插件和语言服务提供程序

##### Windows

-   一个建议：PowerShell
    PowerShell的体验比原生的Shell好
    使用PowerShell(微软商店直接搜就行), 然后把终端的`设置/启动/默认配置文件`换成PowerShell

-   另一个建议：Nerd Font
    Nerd Font中包含许多字符，部分字符会被用来显示一些特殊的内容，比如C++等语言的logo
    在https://www.nerdfonts.com/font-downloads选择一款自己喜欢的字体, 在安装时最好选Mono(等宽)字体
    然后把终端的`设置/默认值/外观/字体`选择为刚刚安装的字体(你可能需要彻底关闭终端后重新打开)

###### 安装Chocolatey

Chocolatey是一个支持Windows的包管理工具，能方便地安装一系列软件包

```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
```

###### 使用Chocolatey安装neovim, neovide

**这一步骤建议在管理员身份下执行(可以按Win+X, A快速打开一个管理员身份的终端)**

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

###### 还有一件事

打开nvim或neovide，等待下载插件和语言服务提供程序
