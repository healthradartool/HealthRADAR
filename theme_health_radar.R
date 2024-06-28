theme_health_radar <- function (base_size = 11, base_family = "",
                                base_line_size = base_size/22,
                                base_rect_size = base_size/22) {
  theme_bw(base_size = base_size, base_family = base_family, 
           base_line_size = base_line_size, base_rect_size = base_rect_size) %+replace% 
    theme(axis.ticks = element_blank(), legend.background = element_blank(), 
          legend.key = element_blank(), panel.background = element_blank(), 
          panel.border = element_blank(), strip.background = element_blank(), 
          plot.background = element_blank(), complete = TRUE)
}