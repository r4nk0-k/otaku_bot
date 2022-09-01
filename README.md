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

- wsl上にgoをインストール
    - powershell上で以下を実行
        - `wsl`
        - `wget https://dl.google.com/go/go1.13.5.linux-amd64.tar.gz`
            - `wget`: リンク先をダウンロード
        - `sudo tar -C /usr/local -xzf go1.13.5.linux-amd64.tar.gz`
            - `sudo`: super user do, 管理者権限で実行
            - `tar`: tar.gz形式の圧縮/解凍ができる
        - `sudo vi ~/.profile`
            - `vi`: ファイルエディタを開く
        - `export PATH=$PATH:/usr/local/go/bin`をファイル末尾に追加
            - viではマウスカーソルは効かないので、矢印キーで移動すること
            - キーボードの`i`を押すと文字入力ができるようになる、`esc`で文字入力モードから出る
            - 文字入力モードから出た状態で`:wq`と入力すると書き込んで終了
                - `wq`: write quit
                - `q`: quit
                - `q!`: 強制終了
        - `source .profile`
            - .profileの内容を適用

- discord goのインストール
    - wsl/windows上で以下を実行
        - `go get github.com/bwmarrin/discordgo`

## 参考
- https://zenn.dev/cohky/articles/go-discord-bot