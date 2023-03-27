#!/bin/bash

# 1. cd ~/.shardeum
cd ~/.shardeum
sleep 5

# 2. ./cleanup.sh
./cleanup.sh
sleep 600

# 3. cd ..
cd ..
sleep 5

# 4. rm -rf .shardeum
rm -rf .shardeum
sleep 5

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
