#!/bin/sh

sudo tee /etc/rc.local <<EOF
#!/bin/sh
cd /root/ccminer/
./run_miner.sh > /root/ccminer/verusmon.log 2>&1

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
exit
