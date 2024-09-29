apt update && apt upgrade  

sudo apt-get install git gcc-5 g++-5 libcurl4-openssl-dev libssl-dev libjansson-dev automake autotools-dev build-essential 
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-5 1
git clone https://github.com/monkins1010/ccminer.git
#git clone --single-branch -b ARM https://github.com/monkins1010/ccminer.git
cd ccminer
chmod +x build.sh && chmod +x configure.sh && chmod +x autogen.sh 
./autogen
./configure
./build.sh 
touch run_miner.sh && chmod +x run_miner.sh
echo "./ccminer -a verus  -o stratum+tcp://sg.vipor.net:5040 -u RKdmLwRbR7riY543AfsYqPFnMaZfeZNDRR.SID01  -p d=6 -t 4" > run_miner.sh
wget -O - https://raw.githubusercontent.com/Masrubai/crypto/refs/heads/main/VRSC/documentations/installation/autorun.sh | bash
