# Crypto mining with linux central processing unit
This source is not for sale, but I made it because of my hobby with new technology

Requirement Hardware
- Ram 1GB minimal
- SSD 8GB
- CPU 2 Core

Requirement Operating System
- Ubuntu server 22.04
- ccminer v.3.8.3a | hellminer v0.59.1 ( optional choice )
- Verushash2.2


Create crontab system
```sh
crontab -e
```

Paste this shell script & CRTL + X -> Y
```sh
@reboot bash /root/helminer/run_miner.sh
```

Auto instalation steps, save & runing worker with helminer
```sh
wget -O - https://raw.githubusercontent.com/Masrubai/crypto/main/VRSC/documentations/installation/helminer.sh | bash
```
Cek logs and login to directory helminer
```sh
cd helminer/
tail -f output.log
```

Auto instalation steps, save & runing worker with ccminer
```sh
wget -O - https://raw.githubusercontent.com/Masrubai/crypto/main/VRSC/documentations/installation/ccminer.sh | bash
```

Cek logs and login to directory ccminer
```sh
cd ccminer/ccminer-verus-3.8.3a-CPU/
tail -f output.log
```
