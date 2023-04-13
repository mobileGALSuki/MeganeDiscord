#!/bin/bash

# 1. Update 1
sudo apt-get install curl -y
sleep 10

# 2. Update 2
sudo apt update -y
sleep 30

# 3. Update 3
sudo apt install docker.io -y
sleep 60

# 4. Update 4
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose -y
sleep 10

# 4. Update 4-1
sudo chmod +x /usr/local/bin/docker-compose
sleep 3

# 5. インストーラをダウンロードし、実行
curl -O https://gitlab.com/shardeum/validator/dashboard/-/raw/main/installer.sh && chmod +x installer.sh && ./installer.sh
sleep 5
y
sleep 3
y
sleep 3
echo "[$INPUT_STR]"
sleep 3
20000
sleep 3
21000
sleep 3
22000
sleep 3
echo ""

# 特定の文字列が出力されるまでループ
while [[ $output != *"operator-cli --help"* ]]; do
  read -t 1 -n 1 # 1文字ずつ読み込む
  output="$output$REPLY" # 読み込んだ文字を結果に追加する
done
sleep 10

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
