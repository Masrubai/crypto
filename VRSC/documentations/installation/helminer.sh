#!/bin/bash

sudo apt update
sudo apt install git libsodium-dev -y

# Membuat folder helminer
mkdir helminer

# Masuk ke folder helminer
cd helminer

# Clone link dari github
wget https://github.com/hellcatz/hminer/releases/download/v0.59.1/hellminer_linux64_avx2.tar.gz

# Tunggu proses selesai dan ekstrak file tar.gz
if [ $? -eq 0 ]; then
  tar -xzvf hellminer_linux64_avx2.tar.gz
  if [ $? -eq 0 ]; then
    # Edit file run_miner.sh
    echo "./hellminer -c stratum+tcp://paddypool.net:9999 -u RKdmLwRbR7riY543AfsYqPFnMaZfeZNDRR.Worker3 -p x --cpu 2" > run_miner.sh
    
    # Berikan izin eksekusi pada file run_miner.sh
    chmod +x run_miner.sh
    # Konfirmasi tugas selesai
    echo "Tugas selesai. Script telah berhasil dijalankan."
  else
    echo "Gagal mengekstrak file tar.gz"
  fi
else
  echo "Gagal mengunduh file dari github"
fi
bash run_miner.sh
