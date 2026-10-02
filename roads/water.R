water <- function(map) {
  map |>
    add_fill_layer(
      id = "water",
      source = "sourdough",
      source_layer = "water",
      filter = list(
        "==",
        "$type",
        "Polygon"
      ),
      fill_color = "hsl(200, 70%, 75%)"
    )
}

water_outline <- function(map) {
  map |>
    add_line_layer(
      id = "water_outline",
      source = "sourdough",
      source_layer = "water",
      filter = list("==", "$type", "Polygon"),
      line_color = "hsl(200, 70%, 70%)",
      line_width = 0.75
    )
}
