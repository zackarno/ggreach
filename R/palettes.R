



reach_colors <- c(
  `lightred`  = singleband$reds[2],
  `medred`  = singleband$reds[11],
  `darkred` = singleband$reds[18],
  `lightgrey`      = singleband$darkgreys[2],
  `medgrey`      = singleband$darkgreys[11],
  `darkgrey`      = singleband$darkgreys[18],
  `lightbeige` = singleband$beiges[2],
  `medbeige` = singleband$beiges[11],
  `darkbeige` = singleband$beiges[18],
  `lightgreen` = singleband$lightgreens[2],
  `green` = singleband$lightgreens[11],
  `darkgreen` = singleband$lightgreens[18],
  `lightyellow` = singleband$yellows[2],
  `medyellow` = singleband$yellows[11],
  `darkyellow` = singleband$yellows[18],
  `lightorange` = singleband$oranges[2],
  `medorange` = singleband$oranges[11],
  `darkorange` = singleband$oranges[18],
  `lightblue` = singleband$lightblues[2],
  `medblue` = singleband$lightblues[11],
  `darkblue` = singleband$lightblues[18]
)


reach_cols <- function(...) {
  cols <- c(...)

  if (is.null(cols))
    return (reach_colors)

  reach_colors[cols]
}

reach_palettes<- list(
  `classic` = reach_cols("medred", "medbeige", "medgrey"),
  `classic_extended` = reach_cols("medred", "medbeige", "medgrey", "medorange", "medgreen","medblue"),
  `cool_to_hot` = reach_cols("lightgreen", "darkred"),
  `darkgrey`= singleband$darkgreys,
  `lightgreys`= singleband$lightgreys,
  `beiges`= singleband$beiges,
  `reds` = singleband$reds,
  `oranges` = singleband$oranges,
  `yellows` = singleband$yellows,
  `lightgreens` = singleband$lightgreens,
  `medgreens` = singleband$medgreens,
  `lightblues` = singleband$lightblues,
  `medblues` = singleband$medblues,
  `greys` = reach_cols("lightgrey","darkgrey")
)

#' Return function to interpolate a drsimonj color palette
#'
#' @param palette Character name of palette in drsimonj_palettes
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param ... Additional arguments to pass to colorRampPalette()
#' @export
reach_pal <- function(palette = "classic", reverse = FALSE, ...) {
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

scale_color_reach <- function(palette = "classic", discrete = TRUE, reverse = FALSE, ...) {
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
scale_fill_reach <- function(palette = "classic", discrete = TRUE, reverse = FALSE, ...) {
  pal <- reach_pal(palette = palette, reverse = reverse)

  if (discrete) {
    discrete_scale("fill", paste0("reach_", palette), palette = pal, ...)
  } else {
    scale_fill_gradientn(colours = pal(256), ...)
  }
}



# usethis::use_readme_rmd(open = rlang::is_interactive())


