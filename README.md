# Ubuntu New User Creater

Ubuntu 22.04にて，新しいユーザを作成するシェルスクリプト

## 使い方

1. SSH用の公開鍵をコピーしておく
2. ユーザ名と公開鍵のファイル名を指定して，以下のコマンドを実行する．公開鍵のファイル名は，相対パスでも問題ないはずである．

    ```bash
    bash RaspbianFile.sh alice public-key.pub
    # この例では，ユーザ名は alice ，公開鍵のファイル名は public-key.pub である．
    ```

## 機能

1. 新規ユーザの作成
2. カレントユーザと同じグループ（ただし，`sudo`を除く）に追加する
3. 公開鍵を`/home/new_username/.ssh/authorized_keys`にコピーする
4. 公開鍵の権限設定を行う

スクリプトは，実行後も公開鍵の削除を行わないため，手動で削除する．
