# RaspbianFile

## 概要
`DockerFile` の `Rapsbian` 版みたいなもの．

## アプリがやること
- アップデート
    - `apt update && apt upgrade -y`
- アプリをインストールする．
    - ufw
- `Wi-Fi` の設定をする
- 追加のアプリをインストールする．
    - git，vim
- 新しい `user` を作成する．
- 公開鍵の設定
    - .pub のcp，
    - chmod，chown，chgrp
- `root`，`pi` のロック

## 人間がやること
- ufwの有効化
- パスワードのsshログインの無効化
- `raspi-config` - `Localisation Options`
