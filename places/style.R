library(mapgl)
fls <- list.files("places", pattern = "\\.R$", full.names = T)
fls <- fls[!grepl("style\\.R")]
for (i in seq_along(fls)) {
  source(fls)
}

maplibre(
  style = c(
    basemap_style(
      color = "#f8f4f0"
    ),
    glyphs = "https://tiles.openstreetmap.us/fonts/{fontstack}/{range}.pbf"
  ),
  center = c(-78, 17),
  zoom = 3.5
) |>
  add_vector_source(
    id = "sourdough",
    url = "https://tiles.openstreetmap.us/vector/sourdough.json"
  ) |>
  water() |>
  boundaries() |>
  places()
