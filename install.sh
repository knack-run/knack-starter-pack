#!/usr/bin/env bash
# Knack Starter Pack: installer (macOS / Linux)
#
# Usage:
#   ./install.sh
#
# Honours $CLAUDE_CONFIG_DIR if set; defaults to ~/.claude.
# Idempotent: re-running is a clean overwrite, not a duplicate install.
# Free pack: no licence key, no prompts.

set -euo pipefail

PACK_ID="knack-starter-pack"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# --- Read pack version from PACK.yaml (single source of truth) ---

PACK_YAML="$SCRIPT_DIR/PACK.yaml"
if [ ! -f "$PACK_YAML" ]; then
  echo "Error: could not find $PACK_YAML. Re-extract the pack zip and try again." >&2
  exit 1
fi
PACK_VERSION="$(awk '/^[[:space:]]*version:[[:space:]]*/ { sub(/^[[:space:]]*version:[[:space:]]*/, ""); sub(/[[:space:]]*$/, ""); print; exit }' "$PACK_YAML")"
if [ -z "$PACK_VERSION" ]; then
  echo "Error: could not read 'version:' from $PACK_YAML. Pack zip may be corrupted." >&2
  exit 1
fi

CLAUDE_CONFIG_DIR="${CLAUDE_CONFIG_DIR:-$HOME/.claude}"

echo "Installing $PACK_ID v$PACK_VERSION"
echo "  install root: $CLAUDE_CONFIG_DIR"

# --- Ensure target directories exist ---

mkdir -p "$CLAUDE_CONFIG_DIR/skills" \
         "$CLAUDE_CONFIG_DIR/commands" \
         "$CLAUDE_CONFIG_DIR/agents"

# --- Copy skills (one directory per skill) ---

if [ -d "$SCRIPT_DIR/skills" ]; then
  for skill_dir in "$SCRIPT_DIR/skills"/*/; do
    [ -d "$skill_dir" ] || continue
    skill_name="$(basename "$skill_dir")"
    rm -rf "$CLAUDE_CONFIG_DIR/skills/$skill_name"
    cp -R "$skill_dir" "$CLAUDE_CONFIG_DIR/skills/$skill_name"
    echo "  - skills/$skill_name"
  done
fi

# --- Copy commands (flat .md files) ---

if [ -d "$SCRIPT_DIR/commands" ]; then
  for cmd_file in "$SCRIPT_DIR/commands"/*.md; do
    [ -f "$cmd_file" ] || continue
    cp "$cmd_file" "$CLAUDE_CONFIG_DIR/commands/"
    echo "  - commands/$(basename "$cmd_file")"
  done
fi

# --- Copy agents (flat .md files) ---

if [ -d "$SCRIPT_DIR/agents" ]; then
  for agent_file in "$SCRIPT_DIR/agents"/*.md; do
    [ -f "$agent_file" ] || continue
    cp "$agent_file" "$CLAUDE_CONFIG_DIR/agents/"
    echo "  - agents/$(basename "$agent_file")"
  done
fi

echo
echo "Done. Restart Claude Code to load the new skills."
echo "Questions or feedback: hello@knack.run"
