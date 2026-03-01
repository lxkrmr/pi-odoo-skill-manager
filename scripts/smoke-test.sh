#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
CLI="$ROOT/pi-odoo-devkit.py"

echo "[smoke] help"
"$CLI" --help >/dev/null
"$CLI" wizard --help >/dev/null
"$CLI" doctor --help >/dev/null
"$CLI" cleanup --help >/dev/null
"$CLI" reset-project-path --help >/dev/null

echo "[smoke] non-interactive path guardrails"
if "$CLI" wizard --yes >/tmp/devkit-smoke.out 2>&1; then
  echo "wizard --yes without path should fail" >&2
  exit 1
fi
grep -q "PROJECT_REPO_PATH is required" /tmp/devkit-smoke.out

if "$CLI" doctor >/tmp/devkit-smoke.out 2>&1; then
  echo "doctor without path in non-interactive mode should fail" >&2
  exit 1
fi
grep -q "PROJECT_REPO_PATH is required" /tmp/devkit-smoke.out

if "$CLI" cleanup --yes >/tmp/devkit-smoke.out 2>&1; then
  echo "cleanup --yes without path should fail" >&2
  exit 1
fi
grep -q "PROJECT_REPO_PATH is required" /tmp/devkit-smoke.out

TMP_PROJECT="$(mktemp -d)"
trap 'rm -rf "$TMP_PROJECT" /tmp/devkit-smoke.out' EXIT

echo "[smoke] cleanup on empty project"
cat >"$TMP_PROJECT/docker-compose.yml" <<'YAML'
services: {}
YAML
"$CLI" cleanup "$TMP_PROJECT" --all >/dev/null

echo "[smoke] done"
