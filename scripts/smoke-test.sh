#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
PY="$ROOT/.venv/bin/python"
CLI="$ROOT/pi-odoo-devkit.py"
CHECKER="$ROOT/scripts/check-skills-consistency.py"

if [ ! -x "$PY" ]; then
  echo "Missing $PY" >&2
  echo "Run: ./scripts/bootstrap.sh" >&2
  exit 1
fi

if ! "$PY" -c "import click" >/dev/null 2>&1; then
  echo "Missing Python dependency: click" >&2
  echo "Run: ./scripts/bootstrap.sh" >&2
  exit 1
fi

echo "[smoke] skill metadata consistency"
"$PY" "$CHECKER" >/dev/null

echo "[smoke] help"
"$PY" "$CLI" --help >/dev/null
"$PY" "$CLI" wizard --help >/dev/null
"$PY" "$CLI" doctor --help >/dev/null
"$PY" "$CLI" cleanup --help >/dev/null
"$PY" "$CLI" reset-project-path --help >/dev/null

echo "[smoke] non-interactive path guardrails"
if "$PY" "$CLI" wizard --yes >/tmp/devkit-smoke.out 2>&1; then
  echo "wizard --yes without path should fail" >&2
  exit 1
fi
grep -q "PROJECT_REPO_PATH is required" /tmp/devkit-smoke.out

if "$PY" "$CLI" doctor >/tmp/devkit-smoke.out 2>&1; then
  echo "doctor without path in non-interactive mode should fail" >&2
  exit 1
fi
grep -q "PROJECT_REPO_PATH is required" /tmp/devkit-smoke.out

if "$PY" "$CLI" cleanup --yes >/tmp/devkit-smoke.out 2>&1; then
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
"$PY" "$CLI" cleanup "$TMP_PROJECT" --all >/dev/null

echo "[smoke] done"
