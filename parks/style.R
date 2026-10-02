library(mapgl)
fls <- list.files("parks", pattern = "\\.R$", full.names = T)
fls <- fls[!grepl("style\\.R", fls)]
for (i in seq_along(fls)) {
  source(fls[i])
}

maplibre(
  style = c(
    basemap_style(
      color = "#f8f4f0"
    ),
    glyphs = "https://tiles.openstreetmap.us/fonts/{fontstack}/{range}.pbf",
    sprite = "https://sourdough.osm.fyi/assets/sprites"
  ),
  center = c(-122.6, 48.55),
  zoom = 9.5
) |>
  add_vector_source(
    id = "sourdough",
    url = "https://tiles.openstreetmap.us/vector/sourdough.json"
  ) |>
  water() |>
  parks() |>
  hillshade() |>
  boundaries()
