# Getting Started (Clone → Wizard → Start)

## 1) Clone repositories

```bash
cd /path/to/workspace
git clone <odoo-project-repo-url> odoo-project
git clone <pi-odoo-devkit-repo-url> pi-odoo-devkit
```

## 2) Run setup wizard

```bash
cd /path/to/pi-odoo-devkit
./pi-odoo-devkit.py wizard /path/to/odoo-project
```

## 3) (Recommended) allow direnv

```bash
cd /path/to/pi-odoo-devkit
direnv allow
```

## 4) Run doctor

```bash
./pi-odoo-devkit.py doctor /path/to/odoo-project
```

## 5) Use devkit from project repo

```bash
cd /path/to/odoo-project
./.pi/devkit --help
./.pi/devkit components
./.pi/devkit up
```

## Reconfigure later

```bash
cd /path/to/pi-odoo-devkit
./pi-odoo-devkit.py wizard /path/to/odoo-project
```

## Cleanup

```bash
cd /path/to/pi-odoo-devkit
./pi-odoo-devkit.py cleanup /path/to/odoo-project

# full cleanup
./pi-odoo-devkit.py cleanup /path/to/odoo-project --all --remove-local-exclude
```
