# Release Checklist

Use this checklist for `osmo` releases.

## 1) Preflight

- Ensure working tree is clean.
- Run full quality gate:

```bash
./scripts/smoke-test.sh
```

## 2) Version + notes

- Bump version in `pyproject.toml`.
- Add/update release notes in `docs/releases/vX.Y.Z.md`.

## 3) Commit

Use a semantic commit, e.g.:

```bash
git add pyproject.toml docs/releases/vX.Y.Z.md
git commit -m "chore(release): bump to vX.Y.Z and add release notes"
```

## 4) Tag

```bash
git tag -a vX.Y.Z -m "osmo vX.Y.Z"
git push origin main --tags
```

## 5) Operator update note (important)

For users with normal pipx install:

```bash
pipx upgrade osmo
```

For local editable installs (this repo):

```bash
pipx uninstall osmo
pipx install --editable .
```

`pipx reinstall --editable .` is not a valid pipx command.
