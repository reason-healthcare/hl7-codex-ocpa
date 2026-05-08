#!/bin/bash
# _generate-diagrams.sh
# Renders all input/images/*.mermaid files to same-named .svg files.
# Requires: @mermaid-js/mermaid-cli (mmdc) — npm install or npx.
#
# Generated SVGs are committed so downstream IG Publisher builds
# do not require Node.js. Re-run this script whenever a .mermaid
# file changes.

set -euo pipefail

IMAGES_DIR="$(dirname "$0")/input/images"
CONFIG="$IMAGES_DIR/mermaid.config.json"

# Resolve mmdc — prefer local node_modules, fall back to npx
if [ -x "./node_modules/.bin/mmdc" ]; then
  MMDC="./node_modules/.bin/mmdc"
elif command -v mmdc &>/dev/null; then
  MMDC="mmdc"
else
  echo "[diagrams] mmdc not found — installing via npx (one-time download)..."
  MMDC="npx --yes @mermaid-js/mermaid-cli@latest mmdc"
fi

shopt -s nullglob
FILES=("$IMAGES_DIR"/*.mermaid)

if [ ${#FILES[@]} -eq 0 ]; then
  echo "[diagrams] No .mermaid files found in $IMAGES_DIR — nothing to do."
  exit 0
fi

echo "[diagrams] Rendering ${#FILES[@]} diagram(s)..."

ERROR_COUNT=0
for SRC in "${FILES[@]}"; do
  BASE="${SRC%.mermaid}"
  OUT="${BASE}.svg"
  NAME="$(basename "$SRC")"

  echo -n "  $NAME → $(basename "$OUT") ... "
  if $MMDC \
      --input  "$SRC" \
      --output "$OUT" \
      --backgroundColor transparent \
      --configFile "$CONFIG" \
      2>/dev/null; then
    echo "ok"
  else
    echo "FAILED"
    ERROR_COUNT=$((ERROR_COUNT + 1))
  fi
done

if [ $ERROR_COUNT -gt 0 ]; then
  echo "[diagrams] $ERROR_COUNT diagram(s) failed to render."
  exit 1
fi

echo "[diagrams] All diagrams rendered successfully."
