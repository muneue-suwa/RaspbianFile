# RaspbianFile

## What is RaspbianFile

This application sets up `Raspberry Pi OS` automatically such as `DockerFile`.

## Usage

1. Create public key and copy it to `settings/`.

    ```bash
    ssh-keygen  # Create ssh-key
    cp /to/the/path/your-ssh-key.pub settings/  # Copy created ssh-key to settings/
    ```

2. Create and edit `RaspbianFile.cfg`.

    Edit `NEW_USER`, `ADDITIONAL_APPLICATIONS`, `PUBLICKEY_FILENAME`.

3. If you want to use Wi-Fi, create `wpa_supplicant.conf`.

    ```bash
    wpa_passphrase your-wifi-ssid your-wifi-password | tee settings/wpa_supplicant.conf
    ```

## How this works

- Run `apt update` and `apt upgrade`.
- Install `ufw` and additional applications written in `ADDITIONAL_APPLICATIONS`. Default `ADDITIONAL_APPLICATIONS` is `git`, `vim`, `python3`, `python3-venv`, and `python3-pip`.
- (If you create `wpa_supplicant.conf`,) Set up Wi-Fi.
- Create new user
- Set up public key for ssh-login. Copy it to Raspberry Pi OS and set up the permission.
- Lock default users in Raspberry Pi OS for security: `root` and `pi`

## 人間がやること

- `ufw`の有効化する．
- パスワードによるsshログインを無効化する．
- `raspi-config` - `Localisation Options`を設定する．
