parks <- function(map) {
  is_protected_area <- list(
    "in",
    list("get", "boundary"),
    list("literal", list("national_park", "protected_area"))
  )
  is_park <- list(
    "in",
    list("get", "leisure"),
    list("literal", list("park", "nature_reserve"))
  )

  label_paint <- list(
    `icon-color` = "#2b5e22",
    `icon-halo-color` = "#ffffff",
    `icon-halo-width` = 1.75,
    `icon-halo-blur` = 1,
    `text-color` = "#2b5e22",
    `text-halo-color` = "#ffffff",
    `text-halo-width` = 1.5
  )

  label_layout <- list(
    `icon-image` = list("image", "temaki-vertex"),
    `icon-size` = list(
      "interpolate",
      list("linear"),
      list("zoom"),
      8,
      0.7,
      18,
      1
    ),
    `text-field` = list("get", "name"),
    `text-optional` = TRUE,
    `text-size` = 11,
    `text-line-height` = 1.1,
    `text-font` = list("Noto Sans Bold"),
    `text-variable-anchor` = list("top", "bottom", "left", "right"),
    `text-padding` = 5,
    `text-offset` = list(
      "interpolate",
      list("linear"),
      list("zoom"),
      12,
      list("literal", c(0.5, 0.5)),
      22,
      list("literal", c(1, 1))
    ),
    `text-justify` = "auto",
    `symbol-sort-key` = list("get", "_reczoom")
  )

  map |>
    add_fill_layer(
      id = "protected_area_fill",
      source = "sourdough",
      source_layer = "boundaries",
      filter = is_protected_area,
      fill_color = "#dfeab8"
    ) |>
    add_line_layer(
      id = "protected_area_outline",
      source = "sourdough",
      source_layer = "boundaries",
      filter = is_protected_area,
      line_color = "#a8c075",
      line_width = 1
    ) |>
    add_fill_layer(
      id = "park_fill",
      source = "sourdough",
      source_layer = "leisure",
      filter = is_park,
      fill_color = "#dfeab8"
    ) |>
    add_line_layer(
      id = "park_outline",
      source = "sourdough",
      source_layer = "leisure",
      filter = is_park,
      line_color = "#a8c075",
      line_width = 1
    ) |>
    add_layer(
      id = "park_label",
      source = "sourdough",
      type = "symbol",
      source_layer = "leisure",
      slot = "top",
      min_zoom = 8,
      filter = list(
        "all",
        list("==", list("geometry-type"), "Point"),
        list(
          "in",
          list("get", "leisure"),
          list("literal", list("park", "nature_reserve"))
        ),
        list("has", "name"),
        list(">=", list("zoom"), list("+", list("get", "_reczoom"), -1))
      ),
      layout = label_layout,
      paint = label_paint
    ) |>
    add_layer(
      id = "protected_area_label",
      type = "symbol",
      source = "sourdough",
      source_layer = "boundaries",
      slot = "top",
      min_zoom = 4,
      filter = list(
        "all",
        list("==", list("geometry-type"), "Point"),
        list(
          "in",
          list("get", "boundary"),
          list("literal", list("national_park", "protected_area"))
        ),
        list("has", "name"),
        list(">=", list("zoom"), list("+", list("get", "_reczoom"), -1))
      ),
      layout = label_layout,
      paint = label_paint
    )
}
