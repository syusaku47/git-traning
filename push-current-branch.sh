#!/bin/bash

# 現在のブランチ名を取得
current_branch=$(git symbolic-ref --short HEAD 2>/dev/null)

# ブランチ名が取得できたか確認
if [ -z "$current_branch" ]; then
    echo "エラー: 現在のブランチを取得できませんでした。"
    echo "Gitリポジトリ内で実行されているか確認してください。"
    exit 1
fi

echo "現在のブランチ: $current_branch"
echo "リモートリポジトリにpushします..."

# リモートリポジトリにpush
git push origin "$current_branch"

# pushの結果を確認
if [ $? -eq 0 ]; then
    echo "✓ pushが成功しました: $current_branch -> origin/$current_branch"
    exit 0
else
    echo "✗ pushに失敗しました"
    exit 1
fi
