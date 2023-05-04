#!/bin/bash

#Error Check
exists()
{
  command -v "$1" >/dev/null 2>&1
}
if exists curl; then
	echo ''
else
  sudo apt install curl -y < "/dev/null"
fi

read -p "Enter ALCHEMY HTTPS ADDRESS: " ALCHEMY

echo -e "\e[1m\e[32m1. echo \e[0m" && sleep 1
echo 'export ALCHEMY='$ALCHEMY >> $HOME/.bash_profile

echo -e "\e[1m\e[32m2. sudo apt update && sudo apt upgrade -y \e[0m" && sleep 1
sudo apt update && sudo apt upgrade -y

echo -e "\e[1m\e[32m3. sudo apt install pkg-config curl git build-essential libssl-dev -y \e[0m" && sleep 1
sudo apt install pkg-config curl git build-essential libssl-dev -y

echo -e "\e[1m\e[32m4. sudo apt install screen -y \e[0m" && sleep 1
sudo apt install screen -y

echo -e "\e[1m\e[32m5. git clone --branch v0.5.3 https://github.com/eqlabs/pathfinder.git \e[0m" && sleep 1
git clone --branch v0.5.3 https://github.com/eqlabs/pathfinder.git

echo -e "\e[1m\e[32m6. sudo apt install docker.io -y \e[0m" && sleep 1
sudo apt install docker.io -y

echo -e "\e[1m\e[32m7. mkdir -p $HOME/pathfinder \e[0m" && sleep 1
mkdir -p $HOME/pathfinder

echo -e "\e[1m\e[32m8. screen -S starknet -d -m \e[0m" && sleep 1
screen -S starknet -d -m docker run --rm -p 9545:9545 --user "$(id -u):$(id -g)" -e RUST_LOG=info -e PATHFINDER_ETHEREUM_API_URL=$ALCHEMY -v $HOME/pathfinder:/usr/share/pathfinder/data eqlabs/pathfinder
