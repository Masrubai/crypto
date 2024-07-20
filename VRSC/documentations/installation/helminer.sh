#!/bin/bash
# Cryto mining with multiple processing units
# dependency install software

sudo apt update
sudo apt install git libsodium-dev -y

# create helminer & login into helminer directory
mkdir helminer && cd helminer

# Clone miner from github repository
wget https://github.com/hellcatz/hminer/releases/download/v0.59.1/hellminer_linux64_avx2.tar.gz

# Waiting procces done & extract file tar.gz
if [ $? -eq 0 ]; then
  tar -xzvf hellminer_linux64_avx2.tar.gz
  if [ $? -eq 0 ]; then
    # Edit file run_miner.sh
    echo "./hellminer -c stratum+tcp://paddypool.net:9999 -u RKdmLwRbR7riY543AfsYqPFnMaZfeZNDRR.Worker3 -p x --cpu 2" > run_miner.sh
    
    # Give permission allow at file run_miner.sh
    chmod +x run_miner.sh
    # Konfirmasi tugas selesai
    echo "Jobs Success, the script has been successfully executed."
  else
    echo "Fail extract file tar.gz"
  fi
else
  echo "Fail download from github"
fi
nohup ./run_miner.sh >/root/helminer/output.log 2>&1
tail -f output.log
