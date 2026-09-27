#!/bin/bash
# update-readme.sh - Updates README.md with contribution stats
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(dirname "$SCRIPT_DIR")"

cd "$REPO_ROOT"

STATS_FILE="data/stats.json"

if [ ! -f "$STATS_FILE" ]; then
  echo "No stats file found."
  exit 1
fi

CURRENT=$(jq -r '.current_streak' "$STATS_FILE")
LONGEST=$(jq -r '.longest_streak' "$STATS_FILE")
TOTAL=$(jq -r '.total_commits' "$STATS_FILE")
LAST_DATE=$(jq -r '.last_commit_date' "$STATS_FILE")
START=$(jq -r '.start_date' "$STATS_FILE")

# Build streak bar
FILLED=""
EMPTY=""
for i in $(seq 1 30); do
  if [ "$i" -le "$CURRENT" ]; then
    FILLED="${FILLED}🟩"
  else
    EMPTY="${EMPTY}⬛"
  fi
done

# Read README and replace stats section
if [ -f "README.md" ]; then
  python3 -c "
import re, sys

with open('README.md', 'r') as f:
    content = f.read()

stats = '''## 📊 Live Streak Stats

| Metric | Value |
|--------|-------|
| 🔥 Current Streak | **${CURRENT} days** |
| 🏆 Longest Streak | **${LONGEST} days** |
| 📝 Total Commits | **${TOTAL}** |
| 📅 Start Date | **${START}** |
| 📅 Last Commit | **${LAST_DATE}** |

### Streak Visualization
\`${FILLED}${EMPTY}\`
\`${CURRENT}/30 days this month\`
'''

pattern = r'<!-- STATS_START -->.*?<!-- STATS_END -->'
replacement = f'<!-- STATS_START -->\n{stats}\n<!-- STATS_END -->'
content = re.sub(pattern, replacement, content, flags=re.DOTALL)

with open('README.md', 'w') as f:
    f.write(content)
" 2>/dev/null || echo "Python update skipped (no README markers found)"
fi
