#!/bin/bash
# 🐥 ピーちゃんデプロイスクリプト
# 使い方:  ./deploy.sh               （日時メッセージで自動コミット）
#          ./deploy.sh "メッセージ"  （カスタムメッセージで）

set -e
cd "$(dirname "$0")"

# 引数があればコミットメッセージとして使う。なければタイムスタンプ。
MSG="${1:-Update $(date '+%Y-%m-%d %H:%M')}"

echo "🐥 変更を確認するよ〜..."
git add -A

# ステージに変更がなければスキップ
if git diff --cached --quiet; then
  echo "📭 変更ないみたい〜！おやすみ♪"
  exit 0
fi

echo "📦 コミット中: $MSG"
git commit -m "$MSG"

echo "🚀 GitHub に送るよ〜..."
git push

echo ""
echo "✅ デプロイしたよ〜！🎀"
echo "   1〜2分後に GitHub Pages に反映されるはず✨"
