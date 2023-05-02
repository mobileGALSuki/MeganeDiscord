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

echo 'export ALCHEMY='$ALCHEMY >> $HOME/.bash_profile

sudo apt update && sudo apt upgrade -y

sudo apt install pkg-config curl git build-essential libssl-dev -y

sudo apt install screen -y

git clone --branch v0.5.3 https://github.com/eqlabs/pathfinder.git

screen -S node

sudo apt install docker.io -y

mkdir -p $HOME/pathfinder
docker run --rm -p 9545:9545 --user "$(id -u):$(id -g)" -e RUST_LOG=info -e PATHFINDER_ETHEREUM_API_URL=$ALCHEMY -v $HOME/pathfinder:/usr/share/pathfinder/data eqlabs/pathfinder