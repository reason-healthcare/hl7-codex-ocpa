#!/usr/bin/env bash
# =============================================================================
# ig-build.sh — OGCA IG build wrapper
#
# Usage:
#   ./ig-build.sh [command] [options]
#
# Commands:
#   (none)          Full build: diagrams → SUSHI → IG Publisher
#   diagrams        Regenerate SVGs from .mermaid sources only
#   sushi           Run SUSHI FSH compilation only
#   publisher       Run IG Publisher only (no diagrams, no SUSHI)
#   nosushi         Diagrams → IG Publisher (skip SUSHI)
#   notx            Full build without terminology server
#   watch           Full build then watch for changes
#   clean           Remove output/, temp/, template/
#   update          Download / update publisher.jar
#   help, --help    Show this message
#
# Options (append to any command):
#   --no-diagrams   Skip diagram generation step
#   --no-sushi      Skip SUSHI step
# =============================================================================

set -eo pipefail

# ── Colours ──────────────────────────────────────────────────────────────────
if [ -t 1 ]; then
  BOLD="\033[1m"; RESET="\033[0m"
  BLUE="\033[1;34m"; GREEN="\033[1;32m"
  YELLOW="\033[1;33m"; RED="\033[1;31m"
  CYAN="\033[1;36m"
else
  BOLD="" RESET="" BLUE="" GREEN="" YELLOW="" RED="" CYAN=""
fi

# ── Helpers ───────────────────────────────────────────────────────────────────
step()    { echo -e "\n${BLUE}▶ $*${RESET}"; }
ok()      { echo -e "${GREEN}  ✔ $*${RESET}"; }
warn()    { echo -e "${YELLOW}  ⚠ $*${RESET}"; }
fail()    { echo -e "${RED}  ✖ $*${RESET}"; }
info()    { echo -e "${CYAN}  · $*${RESET}"; }
die()     { fail "$*"; exit 1; }

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# ── Prerequisite checks ───────────────────────────────────────────────────────
check_java() {
  if ! command -v java &>/dev/null; then
    die "Java not found. Install Java 11+ to run IG Publisher."
  fi
  local ver
  ver=$(java -version 2>&1 | awk -F '"' '/version/ {print $2}' | cut -d. -f1)
  if [ "${ver:-0}" -lt 11 ] 2>/dev/null; then
    warn "Java ${ver} detected — IG Publisher recommends Java 11+."
  else
    ok "Java ${ver} found."
  fi
}

check_node() {
  if ! command -v node &>/dev/null; then
    warn "Node.js not found — diagram generation will be skipped."
    return 1
  fi
  ok "Node.js $(node --version) found."
  return 0
}

check_sushi() {
  if [ -x "$SCRIPT_DIR/node_modules/.bin/sushi" ]; then
    ok "SUSHI found in node_modules."
    return 0
  elif command -v sushi &>/dev/null; then
    ok "SUSHI found in PATH ($(sushi --version 2>/dev/null | head -1))."
    return 0
  else
    warn "SUSHI not found. Run 'npm install' or 'npm install -g fsh-sushi'."
    return 1
  fi
}

check_publisher() {
  if [ -f "$SCRIPT_DIR/input-cache/publisher.jar" ]; then
    ok "publisher.jar found in input-cache/."
    return 0
  elif [ -f "$SCRIPT_DIR/../publisher.jar" ]; then
    ok "publisher.jar found in parent folder."
    return 0
  else
    die "publisher.jar not found. Run: ./ig-build.sh update"
  fi
}

# ── Build steps ───────────────────────────────────────────────────────────────
run_diagrams() {
  step "Generating diagrams (Mermaid → SVG)"
  if check_node; then
    if bash "$SCRIPT_DIR/_generate-diagrams.sh"; then
      ok "Diagrams rendered."
    else
      warn "Diagram generation failed — continuing with existing SVGs."
    fi
  else
    warn "Skipping diagram generation (Node.js unavailable)."
  fi
}

run_sushi() {
  step "Compiling FSH with SUSHI"
  if check_sushi; then
    (cd "$SCRIPT_DIR" && PATH="$SCRIPT_DIR/node_modules/.bin:$PATH" sushi .)
    ok "SUSHI compilation complete."
  else
    die "SUSHI unavailable — cannot compile FSH."
  fi
}

run_publisher() {
  local extra_args=("$@")
  step "Running IG Publisher"
  check_publisher
  (cd "$SCRIPT_DIR" && bash _genonce.sh "${extra_args[@]}")
}

run_clean() {
  step "Cleaning build artefacts"
  (cd "$SCRIPT_DIR" && bash _build.sh clean)
  ok "Clean complete."
}

run_update() {
  step "Updating IG Publisher"
  (cd "$SCRIPT_DIR" && bash _updatePublisher.sh)
}

show_usage() {
  echo -e "${BOLD}ig-build.sh${RESET} — OGCA IG build wrapper\n"
  echo -e "${BOLD}Usage:${RESET}  ./ig-build.sh [command] [--no-diagrams] [--no-sushi]\n"
  echo -e "${BOLD}Commands:${RESET}"
  printf "  %-14s %s\n" "(none)"    "Full build: diagrams → SUSHI → IG Publisher"
  printf "  %-14s %s\n" "diagrams"  "Regenerate SVGs from .mermaid sources only"
  printf "  %-14s %s\n" "sushi"     "Run SUSHI FSH compilation only"
  printf "  %-14s %s\n" "publisher" "Run IG Publisher only (no diagrams, no SUSHI)"
  printf "  %-14s %s\n" "nosushi"   "Diagrams → IG Publisher (skip SUSHI)"
  printf "  %-14s %s\n" "notx"      "Full build without terminology server (-tx n/a)"
  printf "  %-14s %s\n" "watch"     "Full build then watch for changes"
  printf "  %-14s %s\n" "clean"     "Remove output/, temp/, template/"
  printf "  %-14s %s\n" "update"    "Download / update publisher.jar"
  printf "  %-14s %s\n" "help"      "Show this message"
  echo ""
  echo -e "${BOLD}Options:${RESET}"
  printf "  %-16s %s\n" "--no-diagrams" "Skip diagram generation step"
  printf "  %-16s %s\n" "--no-sushi"    "Skip SUSHI step"
  echo ""
  echo -e "${BOLD}Examples:${RESET}"
  echo "  ./ig-build.sh                  # Full build"
  echo "  ./ig-build.sh diagrams         # Re-render .mermaid files only"
  echo "  ./ig-build.sh notx             # Build offline (no tx server)"
  echo "  ./ig-build.sh --no-diagrams    # Full build, skip diagram step"
  echo "  ./ig-build.sh watch            # Build and watch for changes"
}

# ── Argument parsing ──────────────────────────────────────────────────────────
COMMAND="${1:-all}"
shift 2>/dev/null || true

SKIP_DIAGRAMS=false
SKIP_SUSHI=false
PUBLISHER_ARGS=()

for arg in "$@"; do
  case "$arg" in
    --no-diagrams) SKIP_DIAGRAMS=true ;;
    --no-sushi)    SKIP_SUSHI=true ;;
    *)             PUBLISHER_ARGS+=("$arg") ;;
  esac
done

# ── Dispatch ──────────────────────────────────────────────────────────────────
echo -e "${BOLD}╔══════════════════════════════════════════════════╗${RESET}"
echo -e "${BOLD}║  OGCA IG Build                                   ║${RESET}"
echo -e "${BOLD}╚══════════════════════════════════════════════════╝${RESET}"

case "$COMMAND" in

  all|"")
    check_java
    [ "$SKIP_DIAGRAMS" = false ] && run_diagrams
    [ "$SKIP_SUSHI"    = false ] && run_sushi
    run_publisher "${PUBLISHER_ARGS[@]}"
    echo -e "\n${GREEN}${BOLD}✔ Build complete.${RESET}"
    ;;

  diagrams)
    run_diagrams
    ;;

  sushi)
    run_sushi
    ;;

  publisher)
    check_java
    run_publisher "${PUBLISHER_ARGS[@]}"
    ;;

  nosushi)
    check_java
    [ "$SKIP_DIAGRAMS" = false ] && run_diagrams
    run_publisher "${PUBLISHER_ARGS[@]}"
    echo -e "\n${GREEN}${BOLD}✔ Build complete (SUSHI skipped).${RESET}"
    ;;

  notx)
    check_java
    [ "$SKIP_DIAGRAMS" = false ] && run_diagrams
    [ "$SKIP_SUSHI"    = false ] && run_sushi
    run_publisher -tx n/a "${PUBLISHER_ARGS[@]}"
    echo -e "\n${GREEN}${BOLD}✔ Build complete (no TX server).${RESET}"
    ;;

  watch)
    check_java
    [ "$SKIP_DIAGRAMS" = false ] && run_diagrams
    [ "$SKIP_SUSHI"    = false ] && run_sushi
    step "Watching for changes (Ctrl+C to stop)"
    (cd "$SCRIPT_DIR" && bash _gencontinuous.sh)
    ;;

  clean)
    run_clean
    ;;

  update)
    run_update
    ;;

  help|--help|-h)
    show_usage
    ;;

  *)
    fail "Unknown command: '$COMMAND'"
    echo ""
    show_usage
    exit 1
    ;;
esac
