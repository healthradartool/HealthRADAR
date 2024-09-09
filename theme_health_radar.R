theme_health_radar <- function (base_size = 11, base_family = "",
                                base_line_size = base_size/22,
                                base_rect_size = base_size/22) {
  theme_minimal(base_size = base_size, base_family = base_family) %+replace% 
    theme(axis.ticks = element_blank(), 
          legend.background = element_blank(), 
          legend.key = element_blank(), 
          panel.background = element_blank(), 
          panel.border = element_blank(), 
          strip.background = element_blank(), 
          plot.background = element_blank(), 
          plot.title = element_text(hjust = 0.5, size = 14, face = "bold"),  # Centered, bold title with size 14
          plot.subtitle = element_text(hjust = 0.5, size = 12),  # Centered subtitle with size 12
          plot.caption = element_text(hjust = 0, size = 10, face = "italic"),  # Left-aligned caption, italicized
          legend.position = "right",  # Legend on the right side
          axis.text.x = element_text(size = 10),  # Consistent x-axis text size
          axis.text.y = element_text(size = 10),  # Consistent y-axis text size
          axis.title.x = element_text(size = 12, margin = margin(t = 5, b = 10)),  # X-axis title with extra space (top margin of 20 points)
          axis.title.y = element_text(size = 12, angle = 90, margin = margin(r = 5)),  # Y-axis title with extra space (right margin of 20 points)
          complete = TRUE)
}

# Function to apply generic manual color scale for discrete variables (colour)
scale_colour_manual_health_radar <- function() {
  manual_colors <- c(
    "#1b9e77",  # Teal Green
    "#d95f02",  # Dark Orange
    "#7570b3",  # Medium Purple
    "#e7298a",  # Pink
    "#66a61e",  # Dark Green
    "#e6ab02",  # Mustard Yellow
    "#a6761d",  # Brown
    "#666666",  # Grey
    "#1f78b4",  # Blue
    "#33a02c",  # Bright Green
    "#ff7f00",  # Bright Orange
    "#6a3d9a",  # Dark Purple
    "#b15928",  # Dark Brown
    "#e31a1c",  # Red
    "#fdbf6f",  # Light Orange
    "#cab2d6",  # Lavender
    "#b2df8a",  # Light Green
    "#a6cee3",  # Light Blue
    "#fb9a99",  # Light Pink
    "#ffff99"   # Pale Yellow
  )
  
  scale_colour_manual(values = manual_colors)  # Apply the colours for 'colour' aesthetic
}

# Function to apply generic manual fill scale for discrete variables (fill)
scale_fill_manual_health_radar <- function() {
  manual_colors <- c(
    "#1b9e77",  # Teal Green
    "#d95f02",  # Dark Orange
    "#7570b3",  # Medium Purple
    "#e7298a",  # Pink
    "#66a61e",  # Dark Green
    "#e6ab02",  # Mustard Yellow
    "#a6761d",  # Brown
    "#666666",  # Grey
    "#1f78b4",  # Blue
    "#33a02c",  # Bright Green
    "#ff7f00",  # Bright Orange
    "#6a3d9a",  # Dark Purple
    "#b15928",  # Dark Brown
    "#e31a1c",  # Red
    "#fdbf6f",  # Light Orange
    "#cab2d6",  # Lavender
    "#b2df8a",  # Light Green
    "#a6cee3",  # Light Blue
    "#fb9a99",  # Light Pink
    "#ffff99"   # Pale Yellow
  )
  
  scale_fill_manual(values = manual_colors)  # Apply the colours for 'fill' aesthetic
}

# Function to apply a generic viridis-based continuous color scale for colour
scale_colour_continuous_health_radar <- function(option = "plasma", na.value = "grey50", name = "Value") {
  scale_colour_viridis_c(option = option, na.value = na.value, name = name)  # Apply viridis scale for colour
}

# Function to apply a generic viridis-based continuous color scale for fill
scale_fill_continuous_health_radar <- function(option = "plasma", na.value = "grey50", name = "Value") {
  scale_fill_viridis_c(option = option, na.value = na.value, name = name)  # Apply viridis scale for fill
}

