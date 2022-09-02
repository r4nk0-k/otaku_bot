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
    - `wget https://packages.microsoft.com/config/debian/10/packages-microsoft-prod.deb -O packages-microsoft-prod.deb`
    - `dpkg -i packages-microsoft-prod.deb`
    - `sudo apt update; sudo apt upgrade`
    - `sudo apt-get install -y dotnet-runtime-3.1`
    - `wget -O /etc/apt/trusted.gpg.d/wsl-transdebian.gpg https://arkane-systems.github.io/wsl-transdebian/apt/wsl-transdebian.gpg`
    - `chmod a+r /etc/apt/trusted.gpg.d/wsl-transdebian.gpg`
    - `chmod 777 /etc/apt/sources.list.d/`

    - ``` 
        cat << EOF > /etc/apt/sources.list.d/wsl-transdebian.list
        deb https://arkane-systems.github.io/wsl-transdebian/apt/ $(lsb_release -cs) main
        deb-src https://arkane-systems.github.io/wsl-transdebian/apt/ $(lsb_release -cs) main
        EOF
        ```

    - `apt update`
    - `sudo apt install -y systemd-genie`

## dockerの使い方
- `docker build -t name:tag [dirname]`
    - dockerfileをビルドしてイメージを作る。Dockerfileに記載された内容を実行するイメージを作成
    - `-t`: タグ付け、名前をつける。tagは省略可能。
        - `-t hoge_image:latest`, `-t hoge_image`
    - `[dirname]`: dockerfileがあるディレクトリ、自分の今いるところなら`.`
        - ファイル名はDockerfileじゃないとダメ、別の名前のDockerfileを指定したいときは`-f filename`
        - `docker build .`, `docker build hoge/`
    - `docker build -t go_image .`

- イメージができたら、イメージをもとにしてコンテナの起動
    - `docker image ls`
        - イメージの一覧を表示して、作成したイメージがあることを確認
    - `docker run [imagename]`
        - `docker run go_image`
    - `docker ps`
        - 起動しているコンテナの確認、今回チュートリアルように用意したgoファイルでは即終了するため何も表示されない
    - `docker ps -a`
        - アクティブなコンテナを全て表示、停止中のコンテナも表示される

## gitの使い方
- https://tech-blog.rakus.co.jp/entry/20200529/git

## 参考
- https://zenn.dev/cohky/articles/go-discord-bot