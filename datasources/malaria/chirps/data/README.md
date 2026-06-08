# Data Source: chirps

This README serves as a catalog and description of the origin of the files used in the corresponding data source page, which can be found in the `datasources/malaria/chirps/data/` directory.

## Data Files

- [**PRCPTOT_daily_CHIRPS-3.0-0p05-rnl_199101-202012_SouthernAfrica.nc**](https://github.com/healthradartool/HealthRADAR/raw/refs/heads/main/datasources/malaria/chirps/data/PRCPTOT_daily_CHIRPS-3.0-0p05-rnl_199101-202012_SouthernAfrica.nc):
  - **Used in:** What the Data Looks Like Section
    - Fig.1 (Spatial mean rainfall map)
  - **Download:** Derived from CHIRPS v3 daily data accessed from the [Climate Hazards Center data repository](https://data.chc.ucsb.edu/products/CHIRPS/v3.0/daily/final/rnl/) using the `rnl` disaggregation product at 0.05° resolution.
  - **Processing:** The following processing steps were applied.
    - Daily CHIRPS v3 NetCDF files were read and spatially subset to the Southern Africa region (latitudes -35° to 0°, longitudes 10°E to 42°E).
    - Files within the 1991-2020 climatology period were selected and monthly precipitation totals were summed to produce annual totals for each grid cell.
    - The mean of the annual totals over the 1991-2020 period was calculated to represent the mean annual rainfall.
    - The resulting mean annual rainfall field was saved as a NetCDF file.

- [**PRCPTOT_daily_CHIRPS-3.0-0p05-rnl_19810101-20260430_Tete.csv**](https://github.com/healthradartool/HealthRADAR/raw/refs/heads/main/datasources/malaria/chirps/data/PRCPTOT_daily_CHIRPS-3.0-0p05-rnl_19810101-20260430_Tete.csv):
  - **Used in:** What the Data Looks Like Section
    - Fig. 3 (Daily rainfall time series plot)
  - **Download:** Derived from CHIRPS v3 daily data accessed from the [Climate Hazards Center data repository](https://data.chc.ucsb.edu/products/CHIRPS/v3.0/daily/final/rnl/) using the `rnl` disaggregation product at 0.05° resolution.
  - **Processing:** The following processing steps were applied.
    - Daily CHIRPS v3 NetCDF files were read.
    - The grid cell nearest to Tete city (latitude -16.137°, longitude 33.614°) was extracted using nearest-neighbour selection.
    - The daily time series was saved as a CSV file.

- [**PRCPTOT_mon_CHIRPS-3.0-0p05-rnl_199101-202012_climatology_Tete.csv**](https://github.com/healthradartool/HealthRADAR/raw/refs/heads/main/datasources/malaria/chirps/data/PRCPTOT_mon_CHIRPS-3.0-0p05-rnl_199101-202012_climatology_Tete.csv):
  - **Used in:** What the Data Looks Like Section
    - Fig. 2 (Monthly climatology plot)
  - **Download:** Using the same source as `PRCPTOT_daily_CHIRPS-3.0-0p05-rnl_19810101-20260430_Tete.csv` (see below).
  - **Processing:** The following processing steps were applied.
    - Daily values for the Tete city grid cell were resampled to monthly totals.
    - The monthly time series was subset to the 1991-2020 climatology period.
    - Monthly climatology was calculated by averaging rainfall values for each calendar month across the 30-year period.
    - The resulting monthly averages were saved as a CSV file.

- [**moz_admbnda_adm1_province.shp**](https://github.com/healthradartool/HealthRADAR/raw/refs/heads/main/datasources/malaria/chirps/data/moz_admbnda_adm1_province.shp):
  - **Used in:** Visualisation Section
    - Fig. 1 (mean annual rainfall anomaly by district)
    - Fig. 2 (annual rainfall time series)
    - Fig. 3 (extreme DJF seasons by district)
  - **Download:** Downloaded directly from the [Humanitarian Data Exchange (HDX)](https://data.humdata.org/dataset/cod-ab-moz). This file contains the province-level (admin level 1) administrative boundaries for Mozambique.

- [**moz_admbnda_adm2_district.shp**](https://github.com/healthradartool/HealthRADAR/raw/refs/heads/main/datasources/malaria/chirps/data/moz_admbnda_adm2_district.shp):
  - **Used in:** Visualisation Section
    - Fig. 1 (mean annual rainfall anomaly by district)
    - Fig. 2 (annual rainfall time series)
    - Fig. 3 (extreme DJF seasons by district)
  - **Download:** Downloaded directly from the [Humanitarian Data Exchange (HDX)](https://data.humdata.org/dataset/cod-ab-moz). This file contains the district-level (admin level 2) administrative boundaries for Mozambique.

- [**PRCPTOT_annual_CHIRPS-3.0-0p05-rnl_198101-202512_TeteProvince.csv**](https://github.com/healthradartool/HealthRADAR/raw/refs/heads/main/datasources/malaria/chirps/data/PRCPTOT_annual_CHIRPS-3.0-0p05-rnl_198101-202512_TeteProvince.csv):
  - **Used in:** Visualisation Section
    - Fig. 2 (annual rainfall time series - province mean)
  - **Download:** Derived from CHIRPS v3 daily data accessed from the [Climate Hazards Center data repository](https://data.chc.ucsb.edu/products/CHIRPS/v3.0/daily/final/rnl/) using the `rnl` disaggregation product at 0.05° resolution.
  - **Processing:** The following processing steps were applied.
    - Daily CHIRPS v3 NetCDF files were read and spatially subset to the Tete Province bounding box.
    - Area-weighted spatial averaging was applied using the Tete Province boundary, with weights based on the cosine of latitude.
    - Monthly totals were summed to produce annual totals.
    - The resulting annual time series was saved as a CSV file.

- [**PRCPTOT_annual_CHIRPS-3.0-0p05-rnl_198101-202512_TeteProvince_districts.csv**](https://github.com/healthradartool/HealthRADAR/raw/refs/heads/main/datasources/malaria/chirps/data/PRCPTOT_annual_CHIRPS-3.0-0p05-rnl_198101-202512_TeteProvince_districts.csv):
  - **Used in:** Visualisation Section
    - Fig. 2 (annual rainfall time series - individual district data)
  - **Download:** Using the same source as `PRCPTOT_annual_CHIRPS-3.0-0p05-rnl_198101-202512_TeteProvince.csv` (see above).
  - **Processing:** The following processing steps were applied.
    - Area-weighted spatial averaging was applied separately for each of the 15 districts in Tete Province using district boundaries.
    - Monthly totals were summed to produce annual totals for each district.
    - The resulting annual time series for all districts was saved as a CSV file.

- [**PRCPTOT_anomaly_CHIRPS-3.0-0p05-rnl_201601-202512_vs_199101-202012_TeteProvince_districts.gpkg**](https://github.com/healthradartool/HealthRADAR/raw/refs/heads/main/datasources/malaria/chirps/data/PRCPTOT_anomaly_CHIRPS-3.0-0p05-rnl_201601-202512_vs_199101-202012_TeteProvince_districts.gpkg):
  - **Used in:** Visualisation Section
    - Fig. 1 (mean annual rainfall anomaly by district)
  - **Download:** Using the same source as `PRCPTOT_annual_CHIRPS-3.0-0p05-rnl_198101-202512_TeteProvince_districts.csv` (see above).
  - **Processing:** The following processing steps were applied.
    - District area-weighted annual rainfall totals were calculated from CHIRPS v3 daily data for each year from 1981 to 2025.
    - The mean annual rainfall for each district was calculated for the baseline period (1991-2020) and the comparison period (2016-2025).
    - The percentage anomaly was calculated as the difference between the comparison and baseline means, divided by the baseline mean and multiplied by 100.
    - The resulting anomaly values were merged with the district boundary geometries and saved as a GeoPackage file.

- [**PRCPTOT_DJF_extreme_seasons_CHIRPS-3.0-0p05-rnl_201601-202512_TeteProvince_districts.gpkg**](https://github.com/healthradartool/HealthRADAR/raw/refs/heads/main/datasources/malaria/chirps/data/PRCPTOT_DJF_extreme_seasons_CHIRPS-3.0-0p05-rnl_201601-202512_TeteProvince_districts.gpkg):
  - **Used in:** Visualisation Section
    - Fig. 3 (extreme DJF seasons by district)
  - **Download:** Using the same source as `PRCPTOT_annual_CHIRPS-3.0-0p05-rnl_198101-202512_TeteProvince_districts.csv` (see above).
  - **Processing:** The following processing steps were applied.
    - DJF (December-January-February) seasonal totals were calculated for each district by summing December of the previous year with January and February of the current year.
    - The 90th percentile of DJF seasonal totals over the 1991-2020 baseline period was calculated for each district.
    - The number of DJF seasons in the 2016-2025 comparison period that exceeded the 90th percentile threshold was counted for each district.
    - The resulting counts were merged with the district boundary geometries and saved as a GeoPackage file.
