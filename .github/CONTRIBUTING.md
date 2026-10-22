# Contributing to Health RADAR

Thank you for contributing to Health RADAR.

This guide is the detailed reference for preparing content, working with the website locally and submitting a contribution.

## Code of Conduct

Health RADAR and everyone participating in it are governed by our [Code of Conduct](https://healthradartool.net/code-of-conduct.html). By participating, you agree to uphold it.

## Ways to contribute

There are multiple ways to contribute. You can:

- report a bug or broken link
- suggest a new data source
- correct or clarify existing content
- add a data source page, visualisation or modelling example
- suggest improvements to the website

### Report an issue

Search the [existing issues](https://github.com/healthradartool/HealthRADAR/issues) before opening a new one.

For a bug, include:

- the affected page or file
- what you expected to happen
- what happened instead
- steps to reproduce the problem
- a screenshot or error message, when useful

If you are not familiar with GitHub, use the [Health RADAR issues form](https://healthradartool.net/issues.html).

### Suggest a data source

Use the [new dataset issue template](https://github.com/healthradartool/HealthRADAR/issues/new?template=new-dataset-template.md). Describe what the data contains, how it is accessed, its spatial and temporal resolution, and why it is useful for climate-sensitive infectious disease modelling.

You may suggest a dataset without providing code. A clear description is enough for another contributor to help build on.

## Before you start

For a new data source, guide or substantial website change, open an issue before doing extensive work. This gives maintainers an opportunity to confirm the scope, avoid duplicated effort and identify relevant examples.

Small corrections, such as typos and broken links, can go directly to a pull request.

Keep each contribution focused on one data source, guide, bug or improvement. Small changes are easier to review and less likely to conflict with other work.

## How the website is organised

Health RADAR is a [Quarto](https://quarto.org/) website. Content is written in `.qmd` files and most data processing and visualisation examples use R.

![Pages you write are combined with the shared setup when you run quarto preview. Commit the saved R output in _freeze/, which Netlify reuses to publish the site, and never commit _site/.](/img/contributing/website-organisation.svg)

Most contributions only touch the files under "You write". When you run `quarto preview`, Quarto combines them with the shared setup and produces two folders:

- `_freeze/` holds the saved results of your R code. Commit it with your changes. The live site is built by Netlify from `main` and reuses these results instead of running R again.
- `_site/` is the website built on your machine for previewing. It is ignored by Git, so never commit it.

Preview only re-runs the R code in pages you have changed, and reuses the saved results for everything else. If you change shared R code, such as `theme_health_radar.R`, render each page that uses it with `quarto render <page>.qmd`. Rendering a single page always re-runs its code and updates `_freeze/`.

Each data source page in its own folder under `datasources/malaria/` is listed on the [Data Sources](https://healthradartool.net/data.html) page automatically. The filters on that page come from the page's [categories](#available-categories). Settings shared by all data source pages, such as the title banner, are in `datasources/malaria/_metadata.yml`.

The main files and folders are:

```text
HealthRADAR/
├── datasources/malaria/<datasource>/  # One folder per data source page
├── guides/<topic>/                    # Climate, entomology and modelling guides
├── index.qmd, data.qmd, …             # Site pages
├── _quarto.yml                        # Navigation and site settings
├── style-base.scss                    # Website styling
├── theme_health_radar.R               # Plot theme and colour scales
├── gt_theme_health_radar.R            # Table theme
├── renv.lock                          # R package versions
├── _freeze/                           # Saved R output; commit it
└── _site/                             # Local preview; never commit
```

Start by looking at nearby files that are similar to the change you want to make. For a complete data source example, see the [World Malaria Report page and its supporting files](https://github.com/healthradartool/HealthRADAR/tree/dev/datasources/malaria/who-wmr).

## Setting up the project

### Requirements

Install:

- [Git](https://git-scm.com/downloads), and create a [GitHub account](https://github.com/signup) if you don't have one
- R 4.5 from [CRAN](https://cloud.r-project.org/). The project records R 4.5.0, but any 4.5 release works. If CRAN now offers a newer version, Windows users can find 4.5 on the [previous releases](https://cloud.r-project.org/bin/windows/base/old/) page
- the latest release of [Quarto](https://quarto.org/docs/get-started/)
- on Windows, [Rtools 4.5](https://cloud.r-project.org/bin/windows/Rtools/rtools45/rtools.html). Some of the package versions the project uses have to be built from source, which needs Rtools
- on macOS, the Xcode Command Line Tools, by running `xcode-select --install` in a terminal

On macOS and Linux, the spatial R packages (`sf`, `terra` and `units`) also need the system libraries `GDAL`, `GEOS`, `PROJ` and `udunits`. Install them with your system's package manager. On Windows, Rtools includes them.

We recommend working in an IDE. [RStudio](https://posit.co/download/rstudio-desktop/) works well with this project, but any editor that can open the project folder, such as Positron or VS Code, is fine.

### Fork and clone

Fork [healthradartool/HealthRADAR](https://github.com/healthradartool/HealthRADAR), then clone your fork:

```bash
git clone https://github.com/<your-username>/HealthRADAR.git
cd HealthRADAR
git remote add upstream https://github.com/healthradartool/HealthRADAR.git
```

Open `HealthRADAR.Rproj` in RStudio, or open the `HealthRADAR` folder in your editor. R needs to start in the project folder for the next step to work.

### Install the R packages

The project uses [renv](https://rstudio.github.io/renv/) to keep package versions consistent. You don't need to install renv yourself. The first time you open the project, R installs the version the project needs, and you'll see a message starting with "Bootstrapping renv". If this step fails, check your internet connection and reopen the project.

Then install the packages recorded in `renv.lock`:

```r
renv::restore()
```

The first restore installs around 180 packages and may take some time. If it fails:

- on `sf`, `terra` or `units`, check that the system libraries above are installed
- on `rdhs` or `whowmr`, which are installed from GitHub, GitHub may be limiting anonymous downloads. Create a [personal access token](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/managing-your-personal-access-tokens), add it to your `.Renviron` file as `GITHUB_PAT`, restart R and run `renv::restore()` again

### Preview the website

From the project root, run:

```bash
quarto preview
```

The local preview is available at `http://127.0.0.1:4200`.

Render the complete website without starting a preview server with:

```bash
quarto render
```

You can also render one page while working on it:

```bash
quarto render datasources/malaria/<datasource>/<datasource>.qmd
```

The project uses [Quarto's](https://quarto.org/docs/projects/code-execution.html#freeze) `freeze: auto` option to manage execution, so unchanged computational output can be reused from `_freeze/`.

If you introduce an R package, install it through `renv` and update the lockfile:

```r
renv::install("package-name")
renv::snapshot()
```

Only add a dependency when it provides a clear benefit that existing project packages do not.

## Development workflow

Health RADAR uses two primary branches:

- `dev` is the integration branch. Create a feature branch for your work and create a pull request into `dev`.
- `main` contains the published version of the website. Maintainers promote tested changes from `dev` to `main`.

![Your pull request goes into dev. Maintainers review and merge it, then release dev to main to publish the site.](/img/contributing/development-workflow.svg)

### 1. Update your local `dev` branch

```bash
git checkout dev
git fetch upstream
git merge upstream/dev
```

### 2. Create a branch

Use a short, descriptive name:

```bash
git checkout -b feature/<short-description>
```

Examples include `feature/chirps-page`, `feature/climate-guide`, and `fix/broken-data-link`.

### 3. Make and check your changes

Preview as you work. Commit small, logical groups of changes with clear messages:

```bash
git add <changed-files>
git commit -m "Add CHIRPS data source page"
```

Avoid `git add .` when possible. Staging named files makes it easier to keep generated or unrelated files out of the commit.

### 4. Push and open a pull request

```bash
git push -u origin feature/<short-description>
```

Create a pull request targeting `dev` in `healthradartool/HealthRADAR`. Explain what changed, why it is useful and how you checked it. Link any related issue and include screenshots for visible website changes.

For a small text correction, you may edit the file in GitHub and open a pull request without setting up the project locally. Select `dev` as the base branch.

## Contribute a data source page

Each data source page has its own folder under `datasources/malaria/`.

### Folder structure

Use a short, lowercase folder name. Hyphens are preferred between words.

```text
datasources/malaria/<datasource>/
├── <datasource>.qmd
├── data/
│   ├── README.md
│   └── <small-example-data>
├── images/
│   └── <dataset-thumbnail>.png
└── scripts/                  # Optional access or processing scripts
```

Where possible, avoid adding full source datasets when a small example or subset is sufficient.

### Page metadata

Each page begins with Quarto YAML metadata.

```yaml
---
title: "Data source name"
description: "Short description of the data source"
date: mm/dd/yyyy
draft: true
image: "images/dataset-thumbnail.png"

categories:
  - Climate
  - Gridded
  - Global
  - Daily
---
```

Use `draft: true` until the page is ready to appear in the data source listing. Choose a small set of categories that accurately describes the dataset.

### Available categories

Categories are grouped by theme, geography, temporal resolution and data type. Choose categories from the table below rather than creating new ones, so that filtering and listing pages stay consistent.

| Group | Categories |
| --- | --- |
| Theme | `Climate`, `Epidemiology`, `Entomology`, `Demography`, `Interventions`, `Drug Resistance`, `Health Systems & Policy` |
| Geography | `Global`, `Multi-national`, `Country-level`, `Gridded` |
| Temporal resolution | `Real-time`, `Daily`, `Monthly`, `Annual`, `Historical Archive` |
| Data type | `Survey / Household`, `Surveillance / Routine`, `Observational / Station`, `Modelled Estimates`, `Reports & Scorecards` |

If a dataset needs a category that is not listed here, open an issue to discuss adding it before using it on a page.

### Required sections

Data source pages are described using three main tabs:

```markdown
::: {.page-tabs .panel-tabset}

## Overview

## Visualisations

## Modelling

:::
```

#### Overview

Provides a general high-level description of the data including a description of how to access the data.

#### Visualisations

Provide a small set of useful visualisations that show the type and important characteristics of the data. 

#### Modelling

Provide a focused working example showing how the data can support climate-sensitive infectious disease modelling. 

When editing an existing page, preserve its terminology and structure unless changing them is part of the contribution.

## Pull request checklist

Before opening a pull request, confirm that:

- [ ] the changed page renders without errors
- [ ] the complete website is rendered for changes to shared code, configuration or styling
- [ ] links, images, tabs, tables and code examples work
- [ ] no sensitive, restricted or unnecessarily large files are included
- [ ] new R packages are recorded in `renv.lock`
- [ ] changed computed output in `_freeze/` is included when needed
- [ ] generated `_site/` files are not committed
- [ ] the pull request targets `dev` and explains what changed and how it was checked

Maintainers may request changes. Push follow-up commits to the same branch, the pull request will update automatically.

## Getting help

If you are unsure how to approach a contribution, [open an issue](https://github.com/healthradartool/HealthRADAR/issues) and describe your idea. Questions and decisions recorded publicly can also help future contributors.

