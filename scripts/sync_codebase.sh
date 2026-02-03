# #!/bin/bash

# echo "🔁 Moving current code to previous..."
# rm -rf codebase/previous
# cp -r codebase/current codebase/previous

# echo "⬇️ Pulling latest dev code..."
# cd ../seer-dev || exit
# git pull

# echo "📥 Updating current QA codebase..."
# cd ../seer-qa || exit
# rm -rf codebase/current
# cp -r ../seer-dev codebase/current

# echo "✅ Codebase sync complete."

#!/bin/bash

set -e  # stop script if any command fails

echo "🔁 Moving current QA code to previous..."

# Go to seer-qa root (important)
cd "$(dirname "$0")/.." || exit

rm -rf codebase/previous
mkdir -p codebase/previous
cp -r codebase/current/* codebase/previous/ 2>/dev/null || true


echo "⬇️ Pulling latest dev code..."

cd ../seer-dev || exit
git pull


echo "📥 Updating current QA codebase..."

cd ../seer-qa || exit
rm -rf codebase/current
mkdir -p codebase/current
cp -r ../seer-dev/* codebase/current/


echo "✅ Codebase sync complete."
