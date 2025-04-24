# this script creates the gt table theme for all tables that use the gt package

library(gt) # this should not be necessary but better safe than sorry

gt_theme_health_radar <- function(gt_object, font = "Roboto", font_numeric = "Roboto Mono",..., quiet = TRUE) {
  stopifnot("'gt_object' must be a 'gt_tbl', have you accidentally passed raw data?" = "gt_tbl" %in% class(gt_object))
  
  table_id <- subset(gt_object[['_options']], parameter == 'table_id')[["value"]][[1]]
  
  if(is.na(table_id)){
    table_id <- gt::random_id()
    if(isFALSE(quiet)){
      message(glue::glue(
        "Table has no assigned ID, using random ID '{table_id}' to apply `gt::opt_css()`",
        "\nAvoid this message by assigning an ID: `gt(id = '')`"
      ))
    }
    
    opt_position <- which("table_id" %in% gt_object[["_options"]][["parameter"]])[[1]]
    gt_object[["_options"]][["value"]][[opt_position]] <- table_id
  }
  
  gt_object |>
    opt_table_font(
      font = list(
        google_font(name = font),
        default_fonts()
      ),
      weight = 400
    ) |>
    tab_style(
      style = cell_text(font = google_font(name = font_numeric)),  
      locations = cells_body(columns = where(is.numeric))
    ) |>   
    tab_style(
      locations = cells_title("title"),
      style = cell_text(
        font = google_font(name = font),
        weight = 700
      )
    ) |>
    tab_style(
      locations = cells_title("subtitle"),
      style = cell_text(
        font = google_font(name = font),
        weight = 300
      )
    ) |>
    tab_style(
      style = list(
        cell_borders(
          sides = "top", color = "black", weight = px(0)
        ),
        cell_text(
          font = google_font(name = font),
          transform = "uppercase",
          v_align = "bottom",
          size = px(14),
          weight = 200
        )
      ),
      locations = gt::cells_column_labels(
        columns = gt::everything()
      )
    ) |>
    tab_style(
      style = cell_borders(
        sides = "bottom", color = "black", weight = px(1)
      ),
      locations = cells_row_groups()
    ) |>
    tab_options(
      column_labels.background.color = "white",
      data_row.padding = px(5),
      heading.align = "left",
      heading.title.font.size = 24,
      heading.border.bottom.style = "none",
      heading.subtitle.font.size = 18,
      table.font.size = 11,
      table.font.weight = "400",
      table.border.top.width = px(3),
      table.border.top.style = "none", # transparent
      table.border.bottom.style = "none",
      table.align = "left",
      column_labels.font.weight = "normal",
      column_labels.border.top.style = "none",
      column_labels.border.bottom.width = px(2),
      column_labels.border.bottom.color = "black",
      row_group.border.top.style = "none",
      row_group.border.top.color = "black",
      row_group.border.bottom.width = px(1),
      row_group.border.bottom.color = "white",
      stub.border.color = "white",
      stub.border.width = px(0),
      source_notes.font.size = 13,
      source_notes.border.lr.style = "none",
      ...
    ) |>
    opt_css(
      paste0("#", table_id, " tbody tr:last-child {border-bottom: 2px solid #ffffff00;}"),
      add = TRUE
    )
}