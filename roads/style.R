library(mapgl)
fls <- list.files("roads", pattern = "\\.R$", full.names = T)
fls <- fls[!grepl("style\\.R", fls)]
for (i in seq_along(fls)) {
  source(fls[i])
}

maplibre(
  style = c(
    basemap_style(
      color = "hsl(40, 45%, 89%)"
    ),
    sprite = "https://sourdough.osm.fyi/assets/sprites",
    glyphs = "https://tiles.openstreetmap.us/fonts/{fontstack}/{range}.pbf"
  ),
  center = c(-122.282, 37.818),
  zoom = 13
) |>
  water() |>
  water_outline() |>
  add_roads(layers = list(-1, 0, 1, 2, 3, 4)) |>
  oneway_arrows(road_types) |>
  road_labels(road_types)
