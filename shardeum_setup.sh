#!/bin/bash

read -s -p "Enter Password: " PASSWORD

# 1. Update 1
sudo apt-get install curl -y && echo "Update 1 has completed"

# 2. Update 2
sudo apt update -y && echo "Update 2 has completed"

# 3. Update 3
sudo apt install docker.io -y && echo "Update 3 has completed"

# 4. Update 4
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose -y && echo "Update 4 has completed"
sleep 15

# 4. Update 4-1
sudo chmod +x /usr/local/bin/docker-compose && echo "Update 4-1 has completed"

# 5. インストーラをダウンロードし、実行
output = $(curl -O https://gitlab.com/shardeum/validator/dashboard/-/raw/main/installer.sh && chmod +x installer.sh && ./installer.sh)
sleep 10
echo "y"
sleep 10
echo "y"
sleep 3
echo "[$PASSWORD]"
sleep 3
echo "20000"
sleep 3
echo "21000"
sleep 3
echo "22000"
sleep 3
echo ""

# 特定の文字列が出力されるまでループ
while [[ $output != *"operator-cli --help"* ]]; do
  read -t 1 -n 1 # 1文字ずつ読み込む
  output="$output$REPLY" # 読み込んだ文字を結果に追加する
done
sleep 3

# 6. cd ~/.shardeum
cd ~/.shardeum && echo "Update 6 has completed"

# 7. ./shell.sh
./shell.sh && echo "Update 7 has completed"

# 8. operator-cli gui start
operator-cli gui start && echo "Update 8 has completed"
sleep 5

# 完了メッセージを表示
echo "The macro has been executed successfully."
