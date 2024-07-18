# crypto Mining with linux central processing unit

Requirement Hardware
- Ram 1GB minimal
- SSD 8GB
- CPU 2 Core

Requirement Operating System
- Ubuntu server 22.04
- ccminer v.3.8.3a
- Verushash2.2

## Manual instalation steps
```sh
sudo apt update
sudo apt install git -y
wget https://github.com/Oink70/ccminer-verus/archive/refs/tags/v3.8.3a-CPU.tar.gz
tar -xvzf v3.8.3a-CPU.tar.gz
mv ccminer-verus-3.8.3a-CPU/ ccminer
chmod +x ccminer
cd ccminer
./build.sh
cd ccminer/
nano run
./ccminer -a verus -o stratum+tcp://pool.verus.io:9999 -u RKdmLwRbR7riY543AhgdtgffsYqPFnMaZfyeR.NameWorker -p x -t 2
ctrl +x -> y
./run
