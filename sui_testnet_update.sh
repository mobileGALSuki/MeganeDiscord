#!/bin/bash

echo -e "\e[1m\e[32m Update Sui fullnode \e[0m" && sleep 1
source $HOME/.cargo/env

cd $HOME
sudo systemctl stop suid
rm -rf sui
git clone https://github.com/MystenLabs/sui.git
cd sui
git remote add upstream https://github.com/MystenLabs/sui
git fetch upstream
git checkout -B testnet --track upstream/testnet
cargo build -p sui-node -p sui --release
mv ~/sui/target/release/sui-node /usr/local/bin/
mv ~/sui/target/release/sui /usr/local/bin/

cd $HOME/.sui
wget -O genesis.blob https://github.com/MystenLabs/sui-genesis/raw/main/testnet/genesis.blob

sudo systemctl restart suid


echo "==========================================================================================================================="    

echo -e '\e[32mCheck your sui status\e[39m' && sleep 1
if [[ `service suid status | grep active` =~ "running" ]]; then
  echo -e "Your Sui node \e[32minstalled and running normally\e[39m!"
else
  echo -e "Your Sui node \e[31mwas failed installed\e[39m, Please Re-install."
fi

echo " "
echo -e "\e[1m\e[34mYour Sui Version : $(/usr/local/bin/sui-node -V)\e[0m" && sleep 1
echo " "
echo " "
echo " "

