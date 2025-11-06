# Data Source: cru-ts

This README serves as a catalog and description of the origin of the files used in the corresponding data source page, which can be found in the `datasources/malaria/cru-ts/data/` directory.

## Data Files


- [**Fig1_MeanAnnualRainfall_CRU_TS-4.08_1991-2020_SouthernAfrica.nc**](https://github.com/healthradartool/HealthRADAR/raw/refs/heads/main/datasources/malaria/cru-ts/data/Fig1_MeanAnnualRainfall_CRU_TS-4.08_1991-2020_SouthernAfrica.nc): 
  - **Download:** The following data files were downloaded directly from the [CRU Website](https://crudata.uea.ac.uk/cru/data/hrg/). The files contain precipitation data and are compressed (`.gz`) `NetCDF` files.
    - [cru_ts4.08.1991.2000.pre.dat.nc.gz](https://crudata.uea.ac.uk/cru/data/hrg/cru_ts_4.08/cruts.2406270035.v4.08/pre/cru_ts4.08.1991.2000.pre.dat.nc.gz)
    - [cru_ts4.08.2001.2010.pre.dat.nc.gz](https://crudata.uea.ac.uk/cru/data/hrg/cru_ts_4.08/cruts.2406270035.v4.08/pre/cru_ts4.08.2001.2010.pre.dat.nc.gz)
    - [cru_ts4.08.2011.2020.pre.dat.nc.gz](https://crudata.uea.ac.uk/cru/data/hrg/cru_ts_4.08/cruts.2406270035.v4.08/pre/cru_ts4.08.2011.2020.pre.dat.nc.gz)
  - **Processing:**  The following processing steps were applied to produce the dataset.
    - The downloaded `.gz` files were decompressed to extract the `NetCDF` datasets.
    - The individual `NetCDF` files were opened and combined into a single continuous dataset based on matching spatial and temporal coordinates.
    - The combined dataset was spatially subset to include only the Southern Africa region (latitudes −35° to 0°, longitudes 10°E to 42°E).
    - Monthly precipitation totals were aggregated to obtain annual precipitation totals for each grid cell.
    - The mean of the annual totals over the 1991–2020 period was calculated to represent the mean annual rainfall.
    - The resulting mean annual rainfall field was saved as a `NetCDF` file named `Fig1_MeanAnnualRainfall_CRU_TS-4.08_1991-2020_SouthernAfrica.nc`.

            
- [**Fig2_MeanMonthlyAverageTemp_CRU_TS-4.08_1991-2020_SouthernAfrica.nc**](https://github.com/healthradartool/HealthRADAR/raw/refs/heads/main/datasources/malaria/cru-ts/data/Fig2_MeanMonthlyAverageTemp_CRU_TS-4.08_1991-2020_SouthernAfrica.nc):
  - **Download:** The following data files were downloaded directly from the [CRU Website](https://crudata.uea.ac.uk/cru/data/hrg/). The files contain mean temperature data and are compressed (`.gz`) `NetCDF` files.
    - [cru_ts4.08.1991.2000.tmp.dat.nc.gz](https://crudata.uea.ac.uk/cru/data/hrg/cru_ts_4.08/cruts.2406270035.v4.08/tmp/cru_ts4.08.1991.2000.tmp.dat.nc.gz)
    - [cru_ts4.08.2001.2010.tmp.dat.nc.gz](https://crudata.uea.ac.uk/cru/data/hrg/cru_ts_4.08/cruts.2406270035.v4.08/tmp/cru_ts4.08.2001.2010.tmp.dat.nc.gz)
    - [cru_ts4.08.2011.2020.tmp.dat.nc.gz](https://crudata.uea.ac.uk/cru/data/hrg/cru_ts_4.08/cruts.2406270035.v4.08/tmp/cru_ts4.08.2011.2020.tmp.dat.nc.gz)
  - **Processing:** The following processing steps were applied to produce the dataset.  
    - The downloaded `.gz` files were decompressed to extract the `NetCDF` datasets.  
    - The individual `NetCDF` files were opened and combined into a single continuous dataset based on matching spatial and temporal coordinates.  
    - The combined dataset was spatially subset to include only the Southern Africa region (latitudes −35° to 0°, longitudes 10°E to 42°E).  
    - The average of the monthly mean daily temperatures was calculated over the 1991–2020 period for each grid cell.  
    - Temperature values were converted from Kelvin to degrees Celsius.  
    - The resulting mean temperature field was saved as a `NetCDF` file named `Fig2_MeanMonthlyAverageTemp_CRU_TS-4.08_1991-2020_SouthernAfrica.nc`.


- [**Fig3_PRCPTOT_mon_CRU_TS-4.08_199101-202012_climatology_Bulawayo.csv**](https://github.com/healthradartool/HealthRADAR/raw/refs/heads/main/datasources/malaria/cru-ts/data/Fig3_PRCPTOT_mon_CRU_TS-4.08_199101-202012_climatology_Bulawayo.csv):  
  - **Download:** Using the same data files as for Fig1_MeanAnnualRainfall_CRU_TS-4.08_1991-2020_SouthernAfrica.nc (see above).  
  - **Processing:**  
    - The downloaded `.gz` files were decompressed to extract the `NetCDF` datasets.  
    - The individual `NetCDF` files were opened and combined into a single continuous dataset based on matching spatial and temporal coordinates.  
    - The time series corresponding to the grid cell in which Bulawayo (-20.145, 28.587) lies was extracted.  
    - Monthly climatology was calculated by averaging rainfall values for each calendar month across the 30-year period.  
    - The resulting monthly averages (in millimetres) were saved to a CSV file named `Fig3_PRCPTOT_mon_CRU_TS-4.08_199101-202012_climatology_Bulawayo.csv`.  

            
- [**Fig3_tas_mon_CRU_TS-4.08_199101-202012_climatology_Bulawayo.csv**](https://github.com/healthradartool/HealthRADAR/raw/refs/heads/main/datasources/malaria/cru-ts/data/Fig3_tas_mon_CRU_TS-4.08_199101-202012_climatology_Bulawayo.csv):  
  - **Download:** Using the same data files as for Fig2_MeanMonthlyAverageTemp_CRU_TS-4.08_1991-2020_SouthernAfrica.nc (see above).  
  - **Processing:**  
    - The downloaded `.gz` files were decompressed to extract the `NetCDF` datasets.  
    - The individual `NetCDF` files were opened and combined into a single continuous dataset based on matching spatial and temporal coordinates.  
    - The time series corresponding to the grid cell in which Bulawayo (-20.145, 28.587) lies was extracted.  
    - Monthly climatology was calculated by averaging temperature values for each calendar month across the 30-year period.  
    - Temperature values were converted from Kelvin to degrees Celsius.  
    - The resulting monthly averages were saved to a CSV file named `Fig3_tas_mon_CRU_TS-4.08_199101-202012_climatology_Bulawayo.csv`.

            
- [**Fig4_PRCPTOT_mon_CRU_TS-4.08_190101-202312_Bulawayo.csv**](https://github.com/healthradartool/HealthRADAR/raw/refs/heads/main/datasources/malaria/cru-ts/data/Fig4_PRCPTOT_mon_CRU_TS-4.08_190101-202312_Bulawayo.csv): 
  - **Download:** The following data files were downloaded directly from the [CRU Website](https://crudata.uea.ac.uk/cru/data/hrg/). The files contain precipitation data and are compressed (`.gz`) `NetCDF` files.
    - [cru_ts4.08.1901.1910.pre.dat.nc.gz](https://crudata.uea.ac.uk/cru/data/hrg/cru_ts_4.08/cruts.2406270035.v4.08/pre/cru_ts4.08.1901.1910.pre.dat.nc.gz)  
    - [cru_ts4.08.1911.1920.pre.dat.nc.gz](https://crudata.uea.ac.uk/cru/data/hrg/cru_ts_4.08/cruts.2406270035.v4.08/pre/cru_ts4.08.1911.1920.pre.dat.nc.gz)  
    - [cru_ts4.08.1921.1930.pre.dat.nc.gz](https://crudata.uea.ac.uk/cru/data/hrg/cru_ts_4.08/cruts.2406270035.v4.08/pre/cru_ts4.08.1921.1930.pre.dat.nc.gz)  
    - [cru_ts4.08.1931.1940.pre.dat.nc.gz](https://crudata.uea.ac.uk/cru/data/hrg/cru_ts_4.08/cruts.2406270035.v4.08/pre/cru_ts4.08.1931.1940.pre.dat.nc.gz)  
    - [cru_ts4.08.1941.1950.pre.dat.nc.gz](https://crudata.uea.ac.uk/cru/data/hrg/cru_ts_4.08/cruts.2406270035.v4.08/pre/cru_ts4.08.1941.1950.pre.dat.nc.gz)  
    - [cru_ts4.08.1951.1960.pre.dat.nc.gz](https://crudata.uea.ac.uk/cru/data/hrg/cru_ts_4.08/cruts.2406270035.v4.08/pre/cru_ts4.08.1951.1960.pre.dat.nc.gz)  
    - [cru_ts4.08.1961.1970.pre.dat.nc.gz](https://crudata.uea.ac.uk/cru/data/hrg/cru_ts_4.08/cruts.2406270035.v4.08/pre/cru_ts4.08.1961.1970.pre.dat.nc.gz)  
    - [cru_ts4.08.1971.1980.pre.dat.nc.gz](https://crudata.uea.ac.uk/cru/data/hrg/cru_ts_4.08/cruts.2406270035.v4.08/pre/cru_ts4.08.1971.1980.pre.dat.nc.gz)  
    - [cru_ts4.08.1981.1990.pre.dat.nc.gz](https://crudata.uea.ac.uk/cru/data/hrg/cru_ts_4.08/cruts.2406270035.v4.08/pre/cru_ts4.08.1981.1990.pre.dat.nc.gz)             
    - [cru_ts4.08.1991.2000.pre.dat.nc.gz](https://crudata.uea.ac.uk/cru/data/hrg/cru_ts_4.08/cruts.2406270035.v4.08/pre/cru_ts4.08.1991.2000.pre.dat.nc.gz)
    - [cru_ts4.08.2001.2010.pre.dat.nc.gz](https://crudata.uea.ac.uk/cru/data/hrg/cru_ts_4.08/cruts.2406270035.v4.08/pre/cru_ts4.08.2001.2010.pre.dat.nc.gz)
    - [cru_ts4.08.2011.2020.pre.dat.nc.gz](https://crudata.uea.ac.uk/cru/data/hrg/cru_ts_4.08/cruts.2406270035.v4.08/pre/cru_ts4.08.2011.2020.pre.dat.nc.gz)
    - [cru_ts4.08.2021.2023.pre.dat.nc.gz](https://crudata.uea.ac.uk/cru/data/hrg/cru_ts_4.08/cruts.2406270035.v4.08/pre/cru_ts4.08.2021.2023.pre.dat.nc.gz)
  - **Processing:**  
    - The downloaded `.gz` files were decompressed to extract the `NetCDF` datasets.  
    - The individual `NetCDF` files were opened and combined into a single continuous dataset based on matching spatial and temporal coordinates.  
    - The time series corresponding to the grid cell in which Bulawayo (-20.145, 28.587) lies was extracted.  
    - The monthly time series for precipitation and associated station counts were saved to a CSV file named `Fig4_PRCPTOT_mon_CRU_TS-4.08_190101-202312_Bulawayo.csv`.


- [**Fig5_tas_mon_CRU_TS-4.08_190101-202312_Bulawayo.csv**](https://github.com/healthradartool/HealthRADAR/raw/refs/heads/main/datasources/malaria/cru-ts/data/Fig5_tas_mon_CRU_TS-4.08_190101-202312_Bulawayo.csv): 
  - **Download:** The following data files were downloaded directly from the [CRU Website](https://crudata.uea.ac.uk/cru/data/hrg/). The files contain temperature data and are compressed (`.gz`) `NetCDF` files.  
    - [cru_ts4.08.1901.1910.tmp.dat.nc.gz](https://crudata.uea.ac.uk/cru/data/hrg/cru_ts_4.08/cruts.2406270035.v4.08/tmp/cru_ts4.08.1901.1910.tmp.dat.nc.gz)  
    - [cru_ts4.08.1911.1920.tmp.dat.nc.gz](https://crudata.uea.ac.uk/cru/data/hrg/cru_ts_4.08/cruts.2406270035.v4.08/tmp/cru_ts4.08.1911.1920.tmp.dat.nc.gz)  
    - [cru_ts4.08.1921.1930.tmp.dat.nc.gz](https://crudata.uea.ac.uk/cru/data/hrg/cru_ts_4.08/cruts.2406270035.v4.08/tmp/cru_ts4.08.1921.1930.tmp.dat.nc.gz)  
    - [cru_ts4.08.1931.1940.tmp.dat.nc.gz](https://crudata.uea.ac.uk/cru/data/hrg/cru_ts_4.08/cruts.2406270035.v4.08/tmp/cru_ts4.08.1931.1940.tmp.dat.nc.gz)  
    - [cru_ts4.08.1941.1950.tmp.dat.nc.gz](https://crudata.uea.ac.uk/cru/data/hrg/cru_ts_4.08/cruts.2406270035.v4.08/tmp/cru_ts4.08.1941.1950.tmp.dat.nc.gz)  
    - [cru_ts4.08.1951.1960.tmp.dat.nc.gz](https://crudata.uea.ac.uk/cru/data/hrg/cru_ts_4.08/cruts.2406270035.v4.08/tmp/cru_ts4.08.1951.1960.tmp.dat.nc.gz)  
    - [cru_ts4.08.1961.1970.tmp.dat.nc.gz](https://crudata.uea.ac.uk/cru/data/hrg/cru_ts_4.08/cruts.2406270035.v4.08/tmp/cru_ts4.08.1961.1970.tmp.dat.nc.gz)  
    - [cru_ts4.08.1971.1980.tmp.dat.nc.gz](https://crudata.uea.ac.uk/cru/data/hrg/cru_ts_4.08/cruts.2406270035.v4.08/tmp/cru_ts4.08.1971.1980.tmp.dat.nc.gz)  
    - [cru_ts4.08.1981.1990.tmp.dat.nc.gz](https://crudata.uea.ac.uk/cru/data/hrg/cru_ts_4.08/cruts.2406270035.v4.08/tmp/cru_ts4.08.1981.1990.tmp.dat.nc.gz)  
    - [cru_ts4.08.1991.2000.tmp.dat.nc.gz](https://crudata.uea.ac.uk/cru/data/hrg/cru_ts_4.08/cruts.2406270035.v4.08/tmp/cru_ts4.08.1991.2000.tmp.dat.nc.gz)  
    - [cru_ts4.08.2001.2010.tmp.dat.nc.gz](https://crudata.uea.ac.uk/cru/data/hrg/cru_ts_4.08/cruts.2406270035.v4.08/tmp/cru_ts4.08.2001.2010.tmp.dat.nc.gz)  
    - [cru_ts4.08.2011.2020.tmp.dat.nc.gz](https://crudata.uea.ac.uk/cru/data/hrg/cru_ts_4.08/cruts.2406270035.v4.08/tmp/cru_ts4.08.2011.2020.tmp.dat.nc.gz)  
    - [cru_ts4.08.2021.2023.tmp.dat.nc.gz](https://crudata.uea.ac.uk/cru/data/hrg/cru_ts_4.08/cruts.2406270035.v4.08/tmp/cru_ts4.08.2021.2023.tmp.dat.nc.gz)  
  - **Processing:**  
    - The downloaded `.gz` files were decompressed to extract the `NetCDF` datasets.  
    - The individual NetCDF files were opened and combined into a single continuous dataset based on matching spatial and temporal coordinates.  
    - The time series corresponding to the grid cell in which Bulawayo (-20.145, 28.587) lies was extracted.  
    - Temperature values were converted from Kelvin to degrees Celsius.  
    - The monthly time series for daily mean temperature and associated station counts were saved to a CSV file named `Fig5_tas_mon_CRU_TS-4.08_190101-202312_Bulawayo.csv`.
