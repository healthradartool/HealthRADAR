# Data Source: ghcnd

This README serves as a catalog and description of the origin of the files used in the corresponding data source page, which can be found in the `datasources/malaria/ghcn/data/` directory.

## Data Files


- [**ghcnd-inventory.txt**](https://github.com/healthradartool/HealthRADAR/raw/refs/heads/main/datasources/malaria/ghcn/data/ghcnd-inventory.txt):
  - **Used in:** Station map plots in the "What the Data Looks Like" section (all four station maps: PRCP, TAVG, TMAX, TMIN).
  - **Download:** Downloaded directly from the [NCEI GHCNd data repository](https://www.ncei.noaa.gov/pub/data/ghcn/daily/ghcnd-inventory.txt). This file contains the full GHCNd station inventory, listing each station's ID, latitude, longitude, variable, first year, and last year of available data.

- [**pr_GHCN_daily_Skukuza-SF000068296.csv**](https://github.com/healthradartool/HealthRADAR/raw/refs/heads/main/datasources/malaria/ghcn/data/pr_GHCN_daily_Skukuza-SF000068296.csv):
  - **Used in:** Visualisation Section 
    - Fig. 1 (daily rainfall time series), 
    - Fig. 3 (annual rainfall comparison with ERA5), 
    - Fig. 5 (monthly rainfall climatology comparison with ERA5)
  - **Download:** Downloaded directly from the [NCEI GHCNd access portal](https://www.ncei.noaa.gov/data/global-historical-climatology-network-daily/access/) for station `SF000068296` (Skukuza, South Africa).
  - **Processing:** The following processing steps were applied.
    - Raw `PRCP` values were converted from tenths of millimetres to millimetres by multiplying by 0.1.
    - The column was renamed to `pr`.
    - The time index was set to daily frequency, with missing dates reindexed to create a complete daily time series.
    - The resulting dataframe, including station metadata and quality flag attribute columns, was saved as `pr_GHCN_daily_Skukuza-SF000068296.csv`.

- [**temp_GHCN_daily_Skukuza-SF000068296.csv**](https://github.com/healthradartool/HealthRADAR/raw/refs/heads/main/datasources/malaria/ghcn/data/temp_GHCN_daily_Skukuza-SF000068296.csv):
  - **Used in:** Visualisation Section 
    - Fig. 2 (daily temperature time series), 
    - Fig. 4 (annual temperature comparison with ERA5), 
    - Fig. 6 (monthly temperature climatology comparison with ERA5)
  - **Download:** Using the same source file as `pr_GHCN_daily_Skukuza-SF000068296.csv` (see above).
  - **Processing:** The following processing steps were applied.
    - Raw values for `TMAX`, `TMIN`, and `TAVG` were converted from tenths of degrees Celsius to degrees Celsius by multiplying by 0.1.
    - Columns were renamed to `tasmax`, `tasmin`, and `tas` respectively.
    - The time index was set to daily frequency, with missing dates reindexed to create a complete daily time series.
    - The temperature time series was subset to start from 1960-01-01.
    - The resulting dataframe, including station metadata and quality flag attribute columns, was saved as `temp_GHCN_daily_Skukuza-SF000068296.csv`.

- [**pr_daily_ERA5_19590101-20241231_Skukuza.csv**](https://github.com/healthradartool/HealthRADAR/raw/refs/heads/main/datasources/malaria/ghcn/data/pr_daily_ERA5_19590101-20241231_Skukuza.csv):
  - **Used in:** Visualisation Section 
    - Fig. 3 (annual rainfall comparison with GHCNd) 
    - Fig. 5 (monthly rainfall climatology comparison with GHCNd).
  - **Download:** Extracted from ERA5 daily NetCDF files sourced from the [Copernicus Climate Data Store](https://cds.climate.copernicus.eu/).
  - **Processing:** The following processing steps were applied.
    - Daily ERA5 precipitation NetCDF files were opened and concatenated along the time dimension.
    - The grid cell nearest to Skukuza (latitude −24.983°, longitude 31.6°) was extracted using nearest-neighbour selection.
    - Daily precipitation totals were computed and saved as `pr_daily_ERA5_19590101-20241231_Skukuza.csv`.

- [**tas_daily_ERA5_19590101-20241231_Skukuza.csv**](https://github.com/healthradartool/HealthRADAR/raw/refs/heads/main/datasources/malaria/ghcn/data/tas_daily_ERA5_19590101-20241231_Skukuza.csv):
  - **Used in:**Visualisation Section 
    - Fig. 4 (annual mean temperature comparison with GHCNd) 
    - Fig. 6 (monthly temperature climatology comparison with GHCNd).
  - **Download:** Extracted from ERA5 daily NetCDF files sourced from the [Copernicus Climate Data Store](https://cds.climate.copernicus.eu/).
  - **Processing:** The following processing steps were applied.
    - Daily ERA5 mean temperature NetCDF files were opened and concatenated along the time dimension.
    - The grid cell nearest to Skukuza (latitude −24.983°, longitude 31.6°) was extracted using nearest-neighbour selection.
    - Daily mean temperature values were saved as `tas_daily_ERA5_19590101-20241231_Skukuza.csv`.

- [**tasmax_daily_ERA5_19590101-20241231_Skukuza.csv**](https://github.com/healthradartool/HealthRADAR/raw/refs/heads/main/datasources/malaria/ghcn/data/tasmax_daily_ERA5_19590101-20241231_Skukuza.csv):
  - **Used in:** Visualisation Section 
    - Fig. 4 (annual maximum temperature comparison with GHCNd) 
    - Fig. 6 (monthly temperature climatology comparison with GHCNd).
  - **Download:** Extracted from ERA5 daily NetCDF files sourced from the [Copernicus Climate Data Store](https://cds.climate.copernicus.eu/).
  - **Processing:** The following processing steps were applied.
    - Daily ERA5 maximum temperature NetCDF files were opened and concatenated along the time dimension.
    - The grid cell nearest to Skukuza (latitude −24.983°, longitude 31.6°) was extracted using nearest-neighbour selection.
    - Daily maximum temperature values were saved as `tasmax_daily_ERA5_19590101-20241231_Skukuza.csv`.

- [**tasmin_daily_ERA5_19590101-20241231_Skukuza.csv**](https://github.com/healthradartool/HealthRADAR/raw/refs/heads/main/datasources/malaria/ghcn/data/tasmin_daily_ERA5_19590101-20241231_Skukuza.csv):
  - **Used in:** Visualisation Section 
    - Fig. 4 (annual minimum temperature comparison with GHCNd) 
    - Fig. 6 (monthly temperature climatology comparison with GHCNd).
  - **Download:** Extracted from ERA5 daily NetCDF files sourced from the [Copernicus Climate Data Store](https://cds.climate.copernicus.eu/).
  - **Processing:** The following processing steps were applied.
    - Daily ERA5 minimum temperature NetCDF files were opened and concatenated along the time dimension.
    - The grid cell nearest to Skukuza (latitude −24.983°, longitude 31.6°) was extracted using nearest-neighbour selection.
    - Daily minimum temperature values were saved as `tasmin_daily_ERA5_19590101-20241231_Skukuza.csv`.
