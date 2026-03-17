#!/bin/bash
d
echo "🔍 File Content Search"
echo "----------------------"
read -p "Search string: " QUERY
read -p "Directory to search (press Enter for home ~): " DIR

DIR=${DIR:-~}
DIR=$(eval echo $DIR)

echo ""
echo "Searching for \"$QUERY\" in $DIR ..."
echo "----------------------"

RESULTS=$(grep -r "$QUERY" "$DIR" -l 2>/dev/null)

if [ -z "$RESULTS" ]; then
  echo "❌ No files found containing \"$QUERY\""
else
  echo "✅ Found in these files:"
  echo "$RESULTS"
  echo ""
  echo "----------------------"
  read -p "Show matching lines? (y/n): " SHOW
  if [ "$SHOW" = "y" ]; then
    grep -r "$QUERY" "$DIR" -n 2>/dev/null
  fi
fi
