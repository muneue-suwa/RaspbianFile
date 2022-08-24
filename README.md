# RaspbianFile

## What is RaspbianFile

This application sets up `Raspberry Pi OS` automatically such as `DockerFile`.

## Usage

1. Create public key and copy it to `settings/`.
    ```bash
    ssh-keygen  # Create ssh-key
    cp /to/the/path/your-ssh-key.pub settings/  # Copy created ssh-key to settings/
    ```
2. Create and edit `NEW_USER`, `PUBLICKEY_FILENAME` in `RaspbianFile.cfg`.

## How this works

- Create new user
- Set up public key for ssh-login. Copy it to Raspberry Pi OS and set up the permission.

## 人間がやること

- パスワードによるsshログインを無効化する．
- `raspi-config` - `Localisation Options`を設定する．
