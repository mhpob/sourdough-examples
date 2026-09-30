boundaries <- function(map) {
  map |>
    add_line_layer(
      id = "boundaries_country",
      source = "sourdough",
      source_layer = "boundaries",
      filter = list(
        "all",
        list("==", "boundary", "administrative"),
        list("==", "admin_level", 2)
      ),
      line_color = "#888888",
      line_width = 1,
    ) |>
    add_line_layer(
      id = "boundaries_state",
      source = "sourdough",
      source_layer = "boundaries",
      filter = list(
        "all",
        list("==", "boundary", "administrative"),
        list("==", "admin_level", 4)
      ),
      line_color = "#888888",
      line_width = 0.5,
      line_dasharray = list(4, 4)
    )
}
