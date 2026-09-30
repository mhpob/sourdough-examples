hillshade <- function(map) {
  # mapgl does not support adding separate background layers, so need to hack it in
  map$x$style$layers <- unname(c(
    map$x$style$layers,
    list(list(
      id = "hillshade_background",
      type = "background",
      paint = list(
        `background-color` = "#fff",
        `background-opacity` = list(
          "interpolate",
          list("linear"),
          list("zoom"),
          12,
          0.0,
          18,
          0.25
        )
      )
    ))
  ))

  map |>
    add_raster_source(
      id = "hillshade",
      url = "https://tiles.openstreetmap.us/raster/hillshade.json"
    ) |>
    add_raster_layer(
      id = "hillshade",
      source = "hillshade",
      raster_opacity = interpolate(
        property = "zoom",
        values = c(12, 18),
        stops = c(0.35, 0.1)
      )
    )
}
