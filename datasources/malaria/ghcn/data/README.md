# Data Source: ghcnd

This README serves as a catalog and description of the origin of the files used in the corresponding data source page, which can be found in the `datasources/malaria/ghcn/data/` directory.

## Data Files

- [**Fig1_ghcnd_PRCP_stations_southern-africa.csv**](https://github.com/healthradartool/HealthRADAR/raw/refs/heads/main/datasources/malaria/ghcn/data/Fig1_ghcnd_PRCP_stations_southern-africa.csv):
  - **Used in:** Fig. 1 (PRCP station map) in the "What the Data Looks Like" section.
  - **Download:** Derived from the full GHCNd station inventory (`ghcnd-inventory.txt`), downloaded from the [NCEI GHCNd data repository](https://www.ncei.noaa.gov/pub/data/ghcn/daily/ghcnd-inventory.txt).
  - **Processing:** The following processing steps were applied.
    - The full inventory was filtered to stations in Southern African countries (South Africa, Mozambique, Zimbabwe, Zambia, Malawi, Botswana, Namibia, Lesotho, Eswatini, and the southern portions of Angola, DR Congo, Republic of Congo, Tanzania, Kenya, Uganda, Rwanda, and Burundi).
    - The filtered inventory was split by variable, keeping only `PRCP` (rainfall) records.
    - The result was saved as `Fig1_ghcnd_PRCP_stations_southern-africa.csv`.

- [**Fig2_ghcnd_TAVG_stations_southern-africa.csv**](https://github.com/healthradartool/HealthRADAR/raw/refs/heads/main/datasources/malaria/ghcn/data/Fig2_ghcnd_TAVG_stations_southern-africa.csv):
  - **Used in:** Fig. 2 (TAVG station map) in the "What the Data Looks Like" section.
  - **Download:** Derived from the full GHCNd station inventory (`ghcnd-inventory.txt`), downloaded from the [NCEI GHCNd data repository](https://www.ncei.noaa.gov/pub/data/ghcn/daily/ghcnd-inventory.txt).
  - **Processing:** Same Southern Africa country filter as `Fig1_ghcnd_PRCP_stations_southern-africa.csv` above, then split to keep only `TAVG` (average temperature) records.

- [**Fig3_ghcnd_TMAX_stations_southern-africa.csv**](https://github.com/healthradartool/HealthRADAR/raw/refs/heads/main/datasources/malaria/ghcn/data/Fig3_ghcnd_TMAX_stations_southern-africa.csv):
  - **Used in:** Fig. 3 (TMAX station map) in the "What the Data Looks Like" section.
  - **Download:** Derived from the full GHCNd station inventory (`ghcnd-inventory.txt`), downloaded from the [NCEI GHCNd data repository](https://www.ncei.noaa.gov/pub/data/ghcn/daily/ghcnd-inventory.txt).
  - **Processing:** Same Southern Africa country filter as `Fig1_ghcnd_PRCP_stations_southern-africa.csv` above, then split to keep only `TMAX` (maximum temperature) records.

- [**Fig4_ghcnd_TMIN_stations_southern-africa.csv**](https://github.com/healthradartool/HealthRADAR/raw/refs/heads/main/datasources/malaria/ghcn/data/Fig4_ghcnd_TMIN_stations_southern-africa.csv):
  - **Used in:** Fig. 4 (TMIN station map) in the "What the Data Looks Like" section.
  - **Download:** Derived from the full GHCNd station inventory (`ghcnd-inventory.txt`), downloaded from the [NCEI GHCNd data repository](https://www.ncei.noaa.gov/pub/data/ghcn/daily/ghcnd-inventory.txt).
  - **Processing:** Same Southern Africa country filter as `Fig1_ghcnd_PRCP_stations_southern-africa.csv` above, then split to keep only `TMIN` (minimum temperature) records.

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
  - **Used in:** Visualisation Section 
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
