source("parks/style.R")
parks_style |>
  jsonlite::toJSON(auto_unbox = T)
