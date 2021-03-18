
reach_colors <- c(
  `lightred`  = "#f7cccdff",
  `darkred` = "#EE5859",
  `lightgrey`      = "#eeefeeff",
  `darkgrey` = "#58585A",
  `lightbeige` = "#f4f2ecff",
  `darkbeige`="#d9d3c2ff"
)


reach_cols <- function(...) {
  cols <- c(...)

  if (is.null(cols))
    return (reach_colors)

  reach_colors[cols]
}

reach_palettes<- list(
  `main` = reach_cols("darkred", "darkbeige","darkgrey"),
  `reds` = reach_cols("light","darkred"),
  `beiges` = reach_cols("lightbeige","darkbeige"),
  `greys` = reach_cols("lightgrey","darkgrey")
)

#' Return function to interpolate a drsimonj color palette
#'
#' @param palette Character name of palette in drsimonj_palettes
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param ... Additional arguments to pass to colorRampPalette()
#' @export
reach_pal <- function(palette = "main", reverse = FALSE, ...) {
  pal <- reach_palettes[[palette]]

  if (reverse) pal <- rev(pal)

  colorRampPalette(pal, ...)
}

#' @name scale_color_reach
#' @rdname scale_color_reach
#' @title scale_color_reach
#'
#' @description Adds a custom reach palette to color
#' @param palette Character name of palette in reach_palettes
#' @param discrete Boolean indicating whether to use discrete or continuous scale (default= T)
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param ... Additional arguments to pass to colorRampPalette()
#' @export

scale_color_reach <- function(palette = "main", discrete = TRUE, reverse = FALSE, ...) {
  pal <- reach_pal(palette = palette, reverse = reverse)

  if (discrete) {
    discrete_scale("colour", paste0("reach_", palette), palette = pal, ...)
  } else {
    scale_color_gradientn(colours = pal(256), ...)
  }
}


#' @name scale_fill_reach
#' @rdname scale_fill_reach
#' @title scale_color_reach
#'
#' @description Adds a custom reach palette to fill
#' @param palette Character name of palette in reach_palettes
#' @param discrete Boolean indicating whether to use discrete or continuous scale (default= T)
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param ... Additional arguments to pass to colorRampPalette()
#' @export
scale_fill_reach <- function(palette = "main", discrete = TRUE, reverse = FALSE, ...) {
  pal <- reach_pal(palette = palette, reverse = reverse)

  if (discrete) {
    discrete_scale("fill", paste0("reach_", palette), palette = pal, ...)
  } else {
    scale_fill_gradientn(colours = pal(256), ...)
  }
}



# usethis::use_readme_rmd(open = rlang::is_interactive())


