#!/bin/bash

# 1. Update 1
sudo apt-get install curl
until [[ "$PWD" == *"~" ]]
do
  sleep 1
done

# 2. Update 2
sudo apt update
until [[ "$PWD" == *"~" ]]
do
  sleep 1
done

# 3. Update 3
sudo apt install docker.io
until [[ "$PWD" == *"~" ]]
do
  sleep 1
done

# 4. Update 4
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
until [[ "$PWD" == *"~" ]]
do
  sleep 1
done

# 4. Update 4-1
sudo chmod +x /usr/local/bin/docker-compose
until [[ "$PWD" == *"~" ]]
do
  sleep 1
done

# 5. インストーラをダウンロードし、実行
curl -O https://gitlab.com/shardeum/validator/dashboard/-/raw/main/installer.sh && chmod +x installer.sh && ./installer.sh
until [[ "$PWD" == *"~" ]]
do
  sleep 1
done

# 6. cd ~/.shardeum
cd ~/.shardeum
sleep 5

# 7. ./shell.sh
./shell.sh
sleep 5

# 8. operator-cli gui start
operator-cli gui start
sleep 5

# 完了メッセージを表示
echo "The macro has been executed successfully."
