# this function creates a card with a title, description, image and link
# adapted from: https://github.com/djnavarro/djnavarro.github.io/blob/main/index.qmd

add_card <- function(src, title, text, url, link_text, img_alt) {
  lines <- c(
    '<div class="g-col-12 g-col-md-6 g-col-xl-6">',
    '<div class="card h-100">',
    paste0(
      '<a href="', 
      url, 
      '"><img src="', 
      src, 
      '"',
      'alt = "',
      img_alt,
      '"',
      'class="card-img-top"></a>'
    ),
    '<div class="card-body">',
    paste0('<h2 class="card-title">', title, '</h2>'),
    paste0('<p class="card-text">', text, '</p>'),
    '</div>',
    '<div class="card-footer">',
    paste0('<a href="', url, '" class="btn btn-primary" target="_blank">', link_text, '</a>'),
    '</div>',
    '</div>',
    '</div>'
  )
  cat(lines, sep="\n")
}