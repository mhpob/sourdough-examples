places <- function(map) {
  map |>
    add_symbol_layer(
      id = "place_labels_country",
      source = "sourdough",
      source_layer = "places",
      filter = list("==", "place", "country"),
      text_field = get_column("name"),
      text_font = list("Noto Sans Bold"),
      text_size = 14,
      text_transform = "uppercase",
      text_color = "#333333",
      text_halo_color = "#ffffff",
      text_halo_width = 1
    ) |>
    add_symbol_layer(
      id = "place_labels_state",
      source = "sourdough",
      source_layer = "places",
      filter = list("==", "place", "state"),
      text_field = get_column("name"),
      text_font = list("Noto Sans Italic"),
      text_size = 12,
      text_transform = "uppercase",
      text_color = "#666666",
      text_halo_color = "#ffffff",
      text_halo_width = 1
    ) |>
    add_symbol_layer(
      id = "place_labels_city_town",
      source = "sourdough",
      source_layer = "places",
      filter = list("in", "place", "city", "town"),
      text_field = get_column("name"),
      text_font = list(
        "match",
        get_column("place"),
        "city",
        list("literal", list("Noto Sans SemiCondensed Bold")),
        list("literal", list("Noto Sans SemiCondensed Regular"))
      ),
      text_size = list(
        "interpolate",
        list("linear"),
        list("zoom"),
        4,
        8,
        10,
        list("log2", get_column("population"))
      ),
      text_color = "#000000",
      text_halo_color = "#ffffff",
      text_halo_width = 1
    )
}
