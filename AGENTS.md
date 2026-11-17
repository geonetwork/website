# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this is

Source of the GeoNetwork opensource website (<https://geonetwork-opensource.org>). It is a Sphinx (reStructuredText) project, not an application. All content lives in `docsrc/`; there is no test suite or linter beyond the Sphinx build itself.

## Commands

```
python3 -m venv venv && source venv/bin/activate
pip install -r requirements.txt

# Same command CI and Jenkins run (-n nitpicky, -W warnings are errors)
sphinx-build -n -W -a -b html docsrc target/website

# Live preview at http://127.0.0.1:8000
sphinx-autobuild -a docsrc target/website
```

`mvn prepare-package` also builds the site (via `pom.xml`), but the plain `sphinx-build` is the one to use. Because of `-W`, any new warning (broken reference, bad RST, missing image) fails CI, so run the strict build before pushing.

## Layout and architecture

- `docsrc/conf.py`: Sphinx config. `version` and `release` hold the current stable GeoNetwork version.
- `docsrc/*.rst`: top-level pages (`index`, `downloads`, `news`, `community`, `docs`, ...). Images sit next to them or in `docsrc/img`, `docsrc/gallery`.
- `docsrc/_theme`: custom theme (based on sphinx_rtd_theme / sphinx_bootstrap_theme). Edit here for layout changes.
- `Jenkinsfile` + `buildtools/Dockerfile.build`: production build and rsync publish. `.github/workflows/docs.yml`: PR/master build check on `docsrc/**` changes.

## Release workflow

New GeoNetwork releases are published as a single commit named like `Releases 4.4.13 and 4.2.18` (two supported branches, stable 4.4.x and maintenance 4.2.x). Each one touches three files:

1. `docsrc/conf.py`: bump `version` and `release` to the new stable release (4.4.x).
2. `docsrc/downloads.rst`: add the new link at the top of its branch's list (4.4.x list and 4.2.x list separately), using the SourceForge URL pattern of the neighbouring entries.
3. `docsrc/news.rst`: add the release announcement entries.

## CI

The Jenkins pipeline builds on every push to the repo and daily (`pollSCM`), and publishes to the server on success. Merging to `master` therefore deploys the site.
