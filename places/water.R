water <- function(map) {
  map |>
    add_fill_layer(
      id = "water",
      source = "sourdough",
      source_layer = "water",
      filter = list("==", "$type", "Polygon"),
      fill_color = "#cbe1f0"
    ) |>
    add_line_layer(
      id = "water_outline",
      source = "sourdough",
      source_layer = "water",
      filter = list("==", "$type", "Polygon"),
      line_color = "#afd1e8",
      line_width = 0.75
    )
}
