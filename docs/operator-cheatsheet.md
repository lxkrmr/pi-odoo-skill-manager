# osmo Operator Cheatsheet

Fast path for a fresh machine / fresh clone.

## 5 commands (copy/paste)

```bash
pipx install --editable .
./scripts/bootstrap.sh
direnv allow
./scripts/install-git-hooks.sh
./scripts/smoke-test.sh
```

## Daily start

```bash
osmo
```

## Update `osmo`

Normal pipx install:

```bash
pipx upgrade osmo
```

Local editable install (this repo):

```bash
pipx uninstall osmo
pipx install --editable .
```

## Quick checks

```bash
osmo --version
osmo help --output json
./scripts/smoke-test.sh
```

## Common issues

### `pipx reinstall --editable .` fails
`pipx reinstall` does not support `--editable`.
Use uninstall + install editable instead.

### Smoke says click missing
Run:

```bash
./scripts/bootstrap.sh
```

### `osmo` not found
Run:

```bash
python3 -m pipx ensurepath
```
Then open a new shell.
