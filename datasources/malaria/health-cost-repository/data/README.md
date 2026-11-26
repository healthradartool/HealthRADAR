# Health Cost Repository example data

These files were exported on 17 November 2026 from the 16 November data release of MASHA's Health Cost Repository (`uct-masha/health-cost-repository`, commit `21f2bc7`). The examples run from these files without a live app or a separate HCR checkout.

| File | How to reproduce it in HCR |
| --- | --- |
| `hcr-summary.xlsx` | In **Visualisations**, select **Malaria**, **Individual Studies**, **Primary**, and publication years **2021–2024**. Choose **Download Summary Data**. |
| `hcr-studies.xlsx` | From the same selection, use **View Publications in Database** above the charts, then **Download Table → Excel workbook**. This preserves the publication-year and evidence-type selection. |
| `hcr-all-diseases.xlsx` | In **Visualisations**, select **All Diseases**, **Individual Studies**, **All Cost Data Types**, and publication years **2016–2025**. Choose **Download Summary Data**. |
| `hcr-disease-interventions.csv` | Save the **Interventions** sheet of `hcr-all-diseases.xlsx` as CSV, keeping its three column headers. |

The two malaria workbooks describe the same 11 publications. The three-disease workbook contains 77 distinct Study IDs. Six of those papers cover both dengue and chikungunya, so there are 83 disease assignments. Use the **Publications** sheet for a publication total and **Coverage by cost data** for counts by intervention, disease and type of cost data. Unit costs for the modelling examples come from the original papers cited on the RADAR page.
