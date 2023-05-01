#!/bin/bash
exists()
{
  command -v "$1" >/dev/null 2>&1
}
if exists curl; then
	echo ''
else
   apt install curl -y < "/dev/null"
fi

echo -e "\e[1m\e[32m1. Install Dependecies \e[0m" && sleep 1
sudo apt update -y
sudo apt install make clang pkg-config libssl-dev build-essential gcc xz-utils git curl vim tmux ntp jq llvm ufw -y < "/dev/null"
echo -e "\e[1m\e[32m2. curl \e[0m" && sleep 1
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -y
echo "=================================================="
echo -e "\e[1m\e[32m3. Cloning snarkOS... \e[0m" && sleep 1
echo -e 'Cloning snarkOS...\n' && sleep 1
cd $HOME
git clone https://github.com/AleoHQ/snarkOS.git --depth 1
echo -e "\e[1m\e[32m4. cd snarkOS \e[0m" && sleep 1
cd snarkOS
echo "=================================================="
echo -e "\e[1m\e[32m5. ./build_ubuntu.sh \e[0m" && sleep 1
bash ./build_ubuntu.sh
source $HOME/.bashrc
source $HOME/.cargo/env
echo -e "\e[1m\e[32m6. Generating an Aleo account address ... \e[0m" && sleep 1
echo -e 'Generating an Aleo account address ...\n' && sleep 1
mkdir $HOME/aleo
echo "==================================================
                  Your Aleo account:
==================================================
" > $HOME/aleo/account_new.txt
date >> $HOME/aleo/account_new.txt
echo -e "\e[1m\e[32m7. snarkos account new >>$HOME/aleo/account_new.txt \e[0m" && sleep 1
snarkos account new >>$HOME/aleo/account_new.txt
sleep 2
echo -e "\e[1m\e[32m8. cat $HOME/aleo/account_new.txt \e[0m" && sleep 1
cat $HOME/aleo/account_new.txt
echo -e "\033[41m\033[30mPLEASE REMEMBER TO SAVE THE ACCOUNT PRIVATE KEY AND VIEW KEY.\033[0m\n"
sleep 3
echo -e "\e[1m\e[32m9. mkdir -p /var/aleo/ \e[0m" && sleep 1
mkdir -p /var/aleo/
echo -e "\e[1m\e[32m10. cat $HOME/aleo/account_new.txt >>/var/aleo/account_backup.txt \e[0m" && sleep 1
cat $HOME/aleo/account_new.txt >>/var/aleo/account_backup.txt
echo 'export PROVER_PRIVATE_KEY'=$(grep "Private Key" $HOME/aleo/account_new.txt | awk '{print $3}') >> $HOME/.bash_profile
echo -e "\e[1m\e[32m11. source $HOME/.bash_profile \e[0m" && sleep 1
source $HOME/.bash_profile
private_key=$(grep "Private Key" $HOME/aleo/account_new.txt | awk '{print $3}')
sudo screen -S aleo
echo -e "\e[1m\e[32m12. ./run-prover.sh \e[0m" && sleep 1
./run-prover.sh
