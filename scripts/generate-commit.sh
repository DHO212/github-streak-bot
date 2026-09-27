#!/bin/bash
# generate-commit.sh - Creates a commit with a random quote or stat
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(dirname "$SCRIPT_DIR")"

cd "$REPO_ROOT"

# Select random quote from quotes.json
QUOTE_COUNT=$(jq length data/quotes.json)
RANDOM_INDEX=$((RANDOM % QUOTE_COUNT))
QUOTE=$(jq -r ".[$RANDOM_INDEX]" data/quotes.json)
AUTHOR=$(jq -r ".[$RANDOM_INDEX].author" data/quotes.json 2>/dev/null || echo "Unknown")
TEXT=$(jq -r ".[$RANDOM_INDEX].text" data/quotes.json)

if [ "$TEXT" = "null" ] || [ -z "$TEXT" ]; then
  TEXT="$QUOTE"
fi

# Update stats
STATS_FILE="data/stats.json"
TODAY=$(date -u +%Y-%m-%d)

if [ ! -f "$STATS_FILE" ]; then
  echo '{"current_streak":0,"longest_streak":0,"total_commits":0,"last_commit_date":null,"total_days_active":0,"start_date":null}' > "$STATS_FILE"
fi

CURRENT=$(jq -r '.current_streak' "$STATS_FILE")
LONGEST=$(jq -r '.longest_streak' "$STATS_FILE")
TOTAL=$(jq -r '.total_commits' "$STATS_FILE")
LAST_DATE=$(jq -r '.last_commit_date' "$STATS_FILE")
START=$(jq -r '.start_date' "$STATS_FILE")

if [ "$LAST_DATE" = "null" ]; then
  START="$TODAY"
  NEW_STREAK=1
else
  YESTERDAY=$(date -u -d "$TODAY - 1 day" +%Y-%m-%d 2>/dev/null || date -u -v-1d +%Y-%m-%d 2>/dev/null)
  if [ "$LAST_DATE" = "$TODAY" ]; then
    NEW_STREAK=$CURRENT
  elif [ "$LAST_DATE" = "$YESTERDAY" ]; then
    NEW_STREAK=$((CURRENT + 1))
  else
    NEW_STREAK=1
  fi
fi

if [ "$NEW_STREAK" -gt "$LONGEST" ]; then
  LONGEST=$NEW_STREAK
fi

TOTAL=$((TOTAL + 1))

jq \
  --argjson streak "$NEW_STREAK" \
  --argjson longest "$LONGEST" \
  --argjson total "$TOTAL" \
  --arg last "$TODAY" \
  --arg start "$START" \
  '.current_streak=$streak | .longest_streak=$longest | .total_commits=$total | .last_commit_date=$last | .start_date=$start | .total_days_active=.total_days_active+1' \
  "$STATS_FILE" > "${STATS_FILE}.tmp" && mv "${STATS_FILE}.tmp" "$STATS_FILE"

# Commit message from quote
COMMIT_MSG="🔥 Day ${NEW_STREAK} | ${TEXT}"

git add -A
git commit -m "$COMMIT_MSG"
