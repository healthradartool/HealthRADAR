---
name: Example dataset
about: Example guide for proposing a dataset for inclusion in Health RADAR
title: World Malaria Report
labels: dataset
assignees: ''

---

## About the data

The WHO World Malaria report, released on an annual basis, provides a comprehensive and up-to-date assessment of trends in malaria control and elimination across the globe. The annexes to the report provide useful information on the data sources and methods used to compile the World Malaria Report, a set of regional malaria profiles and tables of historical time series of case data, commodity distribution, funding amounts and policy adoption.

These datasets provide information on long term trends in malaria control and enable comparison between countries. The data provided are on an annual time scale at the national level, and would not be suitable for subnational analysis or to explore seasonal trends in malaria.


## Accessing the data

The reports can be accessed on the [WHO website](https://www.who.int/teams/global-malaria-programme/reports). Each report has a web page which includes useful contextual information as well as additional resources. The “Annexes in Excel format” will download as a zip file which should be extracted. The annexes can be viewed in the original report in PDF format, though for modelling it is usually preferable to have an excel spreadsheet.

The most recent report may not contain all years of estimates. Should earlier years be required, one can access the annexes from earlier reports and merge these.


## What does the data look like?

### Description

The list of annexes may vary annually. The information included typically looks like this. Data are available for each country and annually. Some datasheets contain a few years of data, while others report data for the most recent year. To make a longer time series of data, you can access older world malaria reports and annexes from the WHO. Be careful to check the data definitions and information on methodology to be sure that data sets can be concatenated.

The annexes can be found in the report itself as in the following examples: ![](images/annex4F.png "WHO World Malaria Report 2023 Annex 4F")

![](images/annex4H.png "WHO World Malaria Report 2023 Annex 4H")

The annexes can also be downloaded as Excel documents from the report page.



## How to use this data?

Here is an example illustrating how to download the data, unzip it and read in a sheet. Sometimes the data needs to be prepared before it is able to be plotted. 

```{r}
downloadIfNotExists <- function(url, filename) {
  if (!file.exists(filename)) {
    download.file(url, filename)
  }
  if (!dir.exists(gsub(".zip", "", filename))) {
    zip::unzip(zipfile = filename, exdir = gsub(".zip", "", filename))
  }
  fnames <- list.files(gsub(".zip", "", filename), recursive = T, full.names = T)
  gsub(paste0("^",gsub(".zip", "", filename),"/"), "", fnames)
}

# Download and unzip the annexes:
url <- "https://cdn.who.int/media/docs/default-source/malaria/world-malaria-reports/wmr2017-excel-annexes.zip"
pathbase <- tempdir()
fpaths <- downloadIfNotExists(url, filename=file.path(pathbase,"wmr2017-excel-annexes.zip"))

# Read in the sheet:
filename <- file.path(pathbase,"wmr2017-excel-annexes/wmr2017-annex-table-a.xls")
wmr2017a <- readxl::read_excel(filename, range = "A2:Q102")
wmr2017a
```



## How to plot this data?


```{r}
library(ggplot2)

# Create the lollipop plot
ggplot(data, aes(x = reorder(Country, Percentage), y = Percentage, color = Survey)) +
  geom_segment(aes(x = Country, xend = Country, y = 0, yend = Percentage), color = "grey") +
  geom_point(size = 4) +
  coord_flip() +
  theme_minimal() +
  labs(title = "Percentage of Households with at least one ITN",
       subtitle = "WMR 4Ea",
       x = "Country",
       y = "Percentage",
       color = "Source") +
  theme(
    plot.title = element_text(hjust = 0.5, size = 20, face = "bold"),
    plot.subtitle = element_text(hjust = 0.5, size = 15),
    axis.title.x = element_text(size = 15),
    axis.title.y = element_text(size = 15),
    axis.text.x = element_text(size = 12),
    axis.text.y = element_text(size = 12),
    legend.title = element_text(size = 15),
    legend.text = element_text(size = 12)
  )
```




## Examples of data use in literature
