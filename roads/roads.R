library(roadzillar)
road_types <- list(
  "motorway",
  "trunk",
  "primary",
  "secondary",
  "tertiary",
  "residential",
  "unclassified",
  "track",
  "service",
  "pedestrian",
  "living_street"
)

road_labels <- function(map, road_types) {
  map |>
    add_symbol_layer(
      id = "road_labels",
      source = "sourdough",
      source_layer = "highways",
      min_zoom = 13,
      filter = list(
        "all",
        c(list("in", "highway"), road_types),
        list("==", "$type", "LineString"),
        list("has", "name")
      ),
      symbol_placement = "line",
      text_field = list("get", "name"),
      text_font = list("Noto Sans Condensed Regular"),
      text_size = list(
        "interpolate",
        list("linear"),
        list("zoom"),
        13,
        9,
        18,
        14
      ),
      text_letter_spacing = 0.05,
      text_rotation_alignment = "map",
      symbol_spacing = 300,
      text_max_angle = 30,
      text_color = "#666",
      text_halo_color = "#fff",
      text_halo_width = 2
    )
}


oneway_arrows <- function(map, road_types) {
  map |>
    add_symbol_layer(
      id = "road_oneway_arrows",
      source = "sourdough",
      source_layer = "highways",
      min_zoom = 15,
      filter = list(
        "all",
        c(list("in", "highway"), road_types),
        list("==", "$type", "LineString"),
        list("has", "oneway"),
        list("in", "oneway", "yes", "1", "-1")
      ),
      symbol_placement = "line",
      symbol_spacing = list(
        "interpolate",
        list("linear"),
        list("zoom"),
        15,
        100,
        18,
        200
      ),
      icon_image = "maki-arrow",
      icon_rotate = list(
        "case",
        list("==", get_column("oneway"), "-1"),
        180,
        0
      ),
      icon_size = list(
        "interpolate",
        list("linear"),
        list("zoom"),
        15,
        0.3,
        18,
        0.8
      ),
      icon_rotation_alignment = "map",
      icon_allow_overlap = T,
      icon_padding = 2,
      icon_color = "#aaaaaa"
    )
}
