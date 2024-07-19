#!/bin/bash
# Cryto mining with multiple processing units
# dependency install software

sudo apt update
sudo apt install git libcurl4-openssl-dev libssl-dev libjansson-dev automake autotools-dev build-essential -y

# create helminer & login into helminer directory
mkdir ccminer && cd ccminer

# Clone miner from github repository
wget https://github.com/Oink70/ccminer-verus/archive/refs/tags/v3.8.3a-CPU.tar.gz

# Waiting procces done & extract file tar.gz
if [ $? -eq 0 ]; then
  tar -xzvf v3.8.3a-CPU.tar.gz
  cd ccminer-verus-3.8.3a-CPU
  chmod +x build.sh && chmod +x configure.sh && chmod +x autogen.sh
  ./build.sh
  if [ $? -eq 0 ]; then
    # Edit file run_miner.sh
    echo "./ccminer -a verus -o stratum+tcp://paddypool.net:9999 -u RKdmLwRbR7riY543AfsYqPFnMaZfeZNDRR.newminer -p d=6 -t 2" > run
    
    # Give permission allow at file run_miner.sh
    chmod +x run
    # Konfirmasi tugas selesai
    echo "Jobs Success, the script has been successfully executed."
  else
    echo "Fail extract file tar.gz"
  fi
else
  echo "Fail download from github"
fi
bash run
