# オタクの勉強用discord bot
## 使用環境
- go
- discord go
- linux(WSL)
- docker(任意)
    - やりたければ
- エディタ(ご自由に)
    - おすすめはVS Code

## 環境構築
- goのインストール
    - https://go.dev/dl/

- wslのインストール
    - windows上でlinuxを動作させるのに必要
    - https://docs.microsoft.com/ja-jp/windows/wsl/install
        - 使用するlinux distributionはubuntu

- wsl上にDockerのインストール
    - wslにログイン
        - Powershell上で`wsl`
    - 必要なパッケージのインストール
        - `sudo apt install apt-transport-https ca-certificates curl gnupg-agent software-properties-common`
    - GPG鍵の入手
        - `curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key  add -`
    - dockerがあるリポジトリの登録
        - `add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"`
    - dockerのインストール
        - `sudo apt-get install docker-ce`
    - docker起動
        - `sudo systemctl start docker`
    - dockerが起動しない場合
        - genieのインストール
            - systemdのPID(ProcessID)が1じゃないとsystemctlが使えないので、無理矢理1にするツール
            - `sudo genie -s`で起動

- genieのインストール(wsl内)
    - `sudo apt install -y daemonize dbus policykit-1`
    - `wget https://packages.microsoft.com/config/debian/10/packages-microsoft-prod.deb -O packages-microsoft-prod.deb dpkg -i packages-microsoft-prod.deb`
    - `sudo apt update; sudo apt upgrade`
    - `sudo apt-get install -y dotnet-runtime-3.1`
    - `curl -s https://packagecloud.io/install/repositories/arkane-systems/wsl-translinux/script.deb`
    - `sudo apt install -y systemd-genie`


## gitの使い方
- https://tech-blog.rakus.co.jp/entry/20200529/git

## 参考
- https://zenn.dev/cohky/articles/go-discord-bot