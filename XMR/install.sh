## install requirements and xmrig tools
sudo apt install -y git build-essential cmake libuv1-dev libssl-dev libhwloc-dev
mkdir monero && cd monero
git clone https://github.com/xmrig/xmrig.git
cd xmrig && mkdir build && cd build
cmake .. && make -j4
sudo tee /root/monero/xmrig/build/monero.sh <<EOF
#!/bin/sh
./xmrig --coin XMR --url "xmr.kryptex.network:7777" --user 425pmSSVKvn8FCnk8eqJLPcFQmZ5ttz1FQropuacde8H48Bbqdp4dGk2BTnZA4XeAShdJxmi3XDafcjKUPeGUbpq2mnVzuX/Xeon-Rig -p x -k -t 4
EOF

# Auto Start Runing Shell Script when rebooting system
sudo tee /etc/rc.local <<EOF
#!/bin/sh

# Custom actions for each service at startup
# By default this script does nothing.

cd monero/xmrig/build/
./monero.sh > /root/xmrmonitor.log 2>&1

exit 0
EOF

sudo chmod +x /etc/rc.local
cd /etc/systemd/system && touch rc-local.service && chmod +x rc-local.service
sudo tee /etc/systemd/system/rc-local.service <<EOF
[Unit]
Description=/etc/rc.local Compatibility
ConditionPathExists=/etc/rc.local

[Service]
Type=forking
ExecStart=/etc/rc.local start
TimeoutSec=0
StandardOutput=tty
RemainAfterExit=yes
SysVStartPriority=99

[Install]
WantedBy=multi-user.target
EOF

sudo systemctl enable rc-local
sudo systemctl start rc-local.service
sudo systemctl status rc-local.service
