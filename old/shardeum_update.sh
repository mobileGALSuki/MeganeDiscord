#!/bin/bash

echo "+-------------------------------------------------------+"
echo "パスワードを入力してください。"
echo "+-------------------------------------------------------+"
read -p ":" INPUT_STR
echo "+-------------------------------------------------------+"
echo "入力したパスワードは[$INPUT_STR]でよろしいですか？"
echo "+-------------------------------------------------------+"

# 1. cd ~/.shardeum
cd ~/.shardeum
sleep 3

# 2. ./cleanup.sh
./cleanup.sh
sleep 300

# 3. cd ..
cd ..
sleep 3

# 4. rm -rf .shardeum
rm -rf .shardeum
sleep 3

# 5. インストーラをダウンロードし、実行
output = $(curl -O https://gitlab.com/shardeum/validator/dashboard/-/raw/main/installer.sh && chmod +x installer.sh && ./installer.sh)
sleep 3
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
