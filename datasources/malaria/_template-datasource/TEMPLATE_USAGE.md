# Template Usage Guide

This template provides a standardized structure for contributing new data source pages to the Health RADAR project. Follow this guide to create a comprehensive documentation page for a malaria data source.

## Quick Start

1. **Copy the template folder**
   ```bash
   cp -r datasources/malaria/_template-datasource datasources/malaria/[your-datasource-name]
   ```

2. **Rename the main file**
   ```bash
   cd datasources/malaria/[your-datasource-name]
   mv template_datasource.qmd [your-datasource-name].qmd
   ```

3. **Fill in the template sections** following the guidance below

4. **Add your data files and images** to the appropriate folders

5. **Test locally** before submitting

## Folder Structure

```
_template-datasource/
├── template_datasource.qmd    # Main documentation file (rename this)
├── data/                       # Data files used in examples
│   └── README.md              # Catalog of data files
├── images/                     # Images and screenshots
│   └── .gitkeep              # Placeholder (can be deleted when you add images)
└── scripts/                    # R scripts for data processing
    ├── packages.R             # Required R packages
    ├── access.R               # Data download/access code
    └── clean.R                # Data cleaning code
```

## Completing the Template

### 1. Front Matter (YAML Header)

Update the metadata at the top of the .qmd file:

```yaml
---
title: "Your Data Source Name"
description: "Brief one-sentence description"
date: 07/15/2024 # Use MM/DD/YYYY format, typically today's date
image: "images/your-image.png"

categories:
  - malaria
  - epidemiology      # Choose relevant categories
  - country-level     # See existing pages for examples
  - annual
---
```

**Category Options** (choose all that apply):
- `malaria` (required)
- `epidemiology`, `climate`, `interventions`, `entomology`
- `country-level`, `subnational`, `global`
- `annual`, `monthly`, `daily`, `spatiotemporal`
- `raster`, `vector`, `tabular`

### 2. Overview Section

**About the data**
- Describe the data source organization and purpose
- Explain what types of information are included
- Specify geographic and temporal coverage
- Highlight key features relevant to CSID modelling

**Accessing the data**
- Provide clear instructions for obtaining the data
- Include direct links to download portals or APIs
- Mention any registration requirements
- Note if R/Python packages are available
- Reference any special tools needed

**What do the data look like?**
- Describe file formats (CSV, NetCDF, Shapefile, etc.)
- List key variables and their meanings
- Show data structure with examples or screenshots
- Explain data granularity (temporal and spatial)

**Key points to consider**
- List important limitations or caveats
- Mention data quality issues
- Describe appropriate and inappropriate uses
- Note any temporal or spatial gaps
- Discuss compatibility with other datasets

**Examples of data use in literature**
- Provide 3-5 citations of published research using this data
- Include DOI links where available
- Briefly note how each study used the data

### 3. Visualisations Section

**How to use this data?**
- Provide working R code examples
- Show how to load and examine the data
- Demonstrate basic data manipulation
- Use the `{gt}` package for formatted tables
- Ensure code is reproducible

**How to plot this data?**
- Include 2-4 visualization examples
- Use `theme_health_radar()` for consistent styling
- Use Health RADAR color palettes:
  - `scale_colour_manual_health_radar()` for discrete colors
  - `scale_fill_manual_health_radar()` for fill colors
  - `scale_fill_continuous_health_radar()` for continuous data
- Add informative captions citing the data source
- Create diverse plot types (time series, maps, bar charts, etc.)

### 4. Modelling Section

**How can this data be used in disease modelling?**

Describe the modelling workflow:

1. **Preparing the data**
   - Data cleaning steps
   - Variable transformations
   - Aggregation methods
   - Joining with other datasets

2. **Model assumptions**
   - What the data represents
   - Appropriate model types
   - Parameter estimation considerations
   - Validation approaches

3. **Example analysis**
   - Provide a worked example
   - Show how to use the data in a simple model
   - Include code and interpretation
   - Visualize results

4. **Policy implications**
   - Discuss how models inform policy
   - Describe what questions can be answered
   - Note limitations for policy recommendations
   - Provide examples of applications

## Code Conventions

### R Code Style
- Use the tidyverse style guide
- Use the pipe operator `|>` (native pipe, not `%>%`)
- Include comments explaining complex operations
- Load packages at the start using the packages.R script
- Source shared theme files: `source(here::here("theme_health_radar.R"))`

### Code Chunks
```r
```{r}
# Always include clear comments
# Use meaningful variable names
# Break complex operations into steps

data <- read_csv("data/file.csv") |>
  filter(year >= 2000) |>
  mutate(rate = cases / population * 1000)
```
```

### Tables
Use the `{gt}` package for well-formatted tables:
```r
data |>
  head(10) |>
  gt() |>
  tab_header(title = "Table Title") |>
  tab_options(table.align = "left")
```

### Plots
Always include:
- Descriptive title and subtitle
- Clear axis labels
- Source attribution in caption
- Health RADAR theme

```r
ggplot(data, aes(x = year, y = cases)) +
  geom_line() +
  theme_health_radar() +
  scale_colour_manual_health_radar() +
  labs(
    title = "Main Title",
    subtitle = "Additional context",
    x = "X Label",
    y = "Y Label",
    caption = str_wrap("Source citation and notes", width = 80)
  )
```

## Data Files

### Adding Data Files
1. Place data files in the `data/` folder
2. Update `data/README.md` with:
   - File name and description
   - Source URL or reference
   - Download date
   - Key variables
   - Coverage (temporal/spatial)

### Data Size Considerations
- Keep example data files small (< 10 MB if possible)
- For large datasets, provide download instructions instead
- Consider using a subset or sample for examples
- Reference full datasets with download links

## Images

### Required Images
1. **Main page image** (referenced in YAML front matter)
   - Representative image for the data source
   - Recommended size: ~800x400 pixels
   - PNG or JPG format
   - Should be visually appealing and relevant

2. **Supporting images** (optional)
   - Screenshots of data portals
   - Diagrams explaining data structure
   - Example visualizations
   - Maps or spatial representations

### Image Attribution
- Ensure you have permission to use images
- Provide attribution in documentation when needed
- Prefer original images or openly licensed content

## Scripts

### packages.R
- List all R packages needed for your page
- Use `suppressPackageStartupMessages()` wrapper
- Include brief comments explaining what each package is used for
- Ensure packages are available on CRAN (or provide installation instructions for GitHub packages)

### access.R
- Code for downloading or accessing data from source
- API calls or web scraping if applicable
- Authentication setup if required
- Save data to the `data/` folder

### clean.R
- Code for cleaning and processing raw data
- Data transformations and derived variables
- Output cleaned data to the `data/` folder
- Document any assumptions made during cleaning

## Testing Your Page

### Local Testing
Before submitting, ensure your page works:

1. **Render the page**
   ```bash
   quarto render datasources/malaria/[your-datasource-name]/[your-datasource-name].qmd
   ```

2. **Check for errors**
   - All code chunks execute without errors
   - All images load correctly
   - All links work
   - Visualizations render as expected

3. **Preview the site**
   ```bash
   quarto preview
   ```

### Common Issues
- **Missing packages**: Add all required packages to `packages.R`
- **File paths**: Use `here::here()` for relative paths
- **Large files**: Avoid committing large data files to the repository
- **Code errors**: Test all code chunks individually

## Checklist Before Submitting

- [ ] Renamed `template_datasource.qmd` to match your data source
- [ ] Updated YAML front matter with correct metadata
- [ ] Filled in all template sections with meaningful content
- [ ] Added at least one main image
- [ ] Updated `data/README.md` with data file information
- [ ] All code chunks execute without errors
- [ ] Used Health RADAR themes and color palettes
- [ ] Included proper citations and source attributions
- [ ] Tested page renders correctly locally
- [ ] Removed placeholder text and comments
- [ ] Added 3-5 literature examples
- [ ] Included at least 2 visualizations
- [ ] Provided a modelling example

## Additional Resources

These resources will be added to this document in the future:
- Code style guide (link to be added)
- Contribution guidelines (link to be added)
- Review checklist (link to be added)

## Getting Help

If you have questions:
1. Review existing data source pages for examples
2. Check the [contribution guide](https://github.com/healthradartool/.github/blob/main/CONTRIBUTING.md)
3. Open an issue on GitHub
4. Contact the maintainers

## Example Pages

For reference, review these existing data source pages:
- `datasources/malaria/who-wmr/` - Comprehensive example with multiple visualizations
- `datasources/malaria/map/` - Spatial data example
- `datasources/malaria/dhs-program/` - Survey data example

---

**Ready to contribute?** Copy this template, follow the guide, and help expand the Health RADAR resource for the global health community!
