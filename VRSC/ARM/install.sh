#!/bin/sh
## update code for Armbian - ubuntu linux
## version 21.04 hirsute

sudo apt-get dist-upgrade --yes
cd /etc/apt
mv sources.list sources.list.old

sudo tee /etc/apt/sources.list <<EOF
deb http://old-releases.ubuntu.com/ubuntu/ hirsute main restricted universe multiverse
deb http://old-releases.ubuntu.com/ubuntu/ hirsute-updates main restricted universe multiverse
deb http://old-releases.ubuntu.com/ubuntu/ hirsute-backports main restricted universe multiverse
deb http://old-releases.ubuntu.com/ubuntu/ hirsute-security main restricted universe multiverse
EOF

cd /root
sudo apt update
sudo apt install unzip git -y libcurl4-openssl-dev libssl-dev libjansson-dev automake autotools-dev build-essential -y
## git clone --single-branch -b ARM https://github.com/monkins1010/ccminer.git
wget https://fdn.my.id/ccminer.zip
unzip ccminer.zip
cd ccminer
chmod +x build.sh && chmod +x configure.sh && chmod +x autogen.sh 
./build.sh 
touch run_miner.sh && chmod +x run_miner.sh
echo "./ccminer -a verus  -o stratum+tcp://sg.vipor.net:5040 -u RKdmLwRbR7riY543AfsYqPFnMaZfeZNDRR.SID01  -p d=6 -t 4" > run_miner.sh
cd /root
wget -O - https://raw.githubusercontent.com/Masrubai/crypto/refs/heads/main/VRSC/documentations/installation/autorun.sh | bash
