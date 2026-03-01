# Skills (`skills/`)

This directory contains devkit-provided skills.

Note: `browser-tools` is adapted third-party code.
See `../THIRD_PARTY.md` for attribution and license information.

## Create a New Skill

Use the CLI scaffold command from repo root:

```bash
./pi-odoo-devkit.py new-skill <new-skill>
```

This creates:

```text
skills/<new-skill>/SKILL.md
```

## Authoring Conventions

- Start from `templates/SKILL.md`
- Fill frontmatter (`name`, `description`)
- Keep commands copy-paste friendly
- Avoid personal paths and real credentials
- Add explicit safety notes for destructive actions
- Keep scope tight (one skill = one clear workflow)

## Required Sections (when applicable)

- When to Use
- Prerequisites
- Steps
- Validation (User-Run)
- Troubleshooting
- Notes / Risks
- Credential Hygiene
