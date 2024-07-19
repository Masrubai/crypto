# crypto Mining with linux central processing unit

Requirement Hardware
- Ram 1GB minimal
- SSD 8GB
- CPU 2 Core

Requirement Operating System
- Ubuntu server 22.04
- ccminer v.3.8.3a
- Verushash2.2


## Create crontab system
```sh
crontab -e
```

## Paste this shell script & CRTL + X -> Y
```sh
@reboot bash /root/helminer/run_miner.sh > /root/helminer/run_miner.log 2>&1
```

## Auto instalation steps, save & runing install
```sh
wget -O - https://raw.githubusercontent.com/Masrubai/crypto/main/VRSC/documentations/installation/helminer.sh | bash
```

