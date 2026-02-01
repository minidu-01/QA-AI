#!/bin/bash

echo "🔁 Moving current code to previous..."
rm -rf codebase/previous
cp -r codebase/current codebase/previous

echo "⬇️ Pulling latest dev code..."
cd ../seer-dev || exit
git pull

echo "📥 Updating current QA codebase..."
cd ../seer-qa || exit
rm -rf codebase/current
cp -r ../seer-dev codebase/current

echo "✅ Codebase sync complete."
