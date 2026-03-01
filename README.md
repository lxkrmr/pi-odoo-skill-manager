# Pi Odoo Devkit (`pi-odoo-devkit`)

Lean CLI toolbox for Odoo + pi.dev workflows.

## CLI entrypoint

```bash
./pi-odoo-devkit.py --help
```

## Core commands

```bash
# setup/reconfigure project links + skill selection
./pi-odoo-devkit.py wizard /path/to/odoo-project

# health checks
./pi-odoo-devkit.py doctor /path/to/odoo-project

# remove devkit-managed project setup
./pi-odoo-devkit.py cleanup /path/to/odoo-project
```

`doctor` requires `/path/to/odoo-project`.
`wizard` and `cleanup` can prompt for it interactively, or you can pass it explicitly.

## After setup (from your Odoo project)

Wizard creates:

- `.pi/skills/shared-devkit/` (selected skills as symlinks)
- `.pi/devkit` → devkit CLI symlink
- `.pi/DEVKIT_AGENT_NOTES.md`

Use:

```bash
cd /path/to/odoo-project
./.pi/devkit --help
./.pi/devkit components
./.pi/devkit up
./.pi/devkit db
./.pi/devkit shell
```

## Pi compatibility behavior

Wizard automatically helps avoid common pi startup noise:

- archives invalid `.pi/skills` artifacts (`README.md`, `_template`)
- archives colliding local skill directories that would conflict by name
- archives legacy `.pi/tools` directory (deprecated in pi; replaced by extensions)

Archived files are kept in `.pi/_...` backup folders.

## Optional flags

```bash
./pi-odoo-devkit.py wizard /path/to/odoo-project --yes --with-browser-tools --add-local-exclude
./pi-odoo-devkit.py cleanup /path/to/odoo-project --all --remove-local-exclude
```

## Repository layout

- `pi-odoo-devkit.py` — single Click-based CLI entrypoint
- `skills/` — reusable skills + `skills/manifest.json`
- `templates/` — skill template(s)
- `LICENSES/`, `THIRD_PARTY.md`, `SECURITY.md`
