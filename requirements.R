# Install all required packages for gun-violence-poverty-analysis
# Run this script once before rendering the Quarto report:
#   Rscript requirements.R

packages <- c(
  "dplyr",
  "tidyverse",
  "skimr",
  "flextable",
  "mice",
  "naniar",
  "gt",
  "plotly",
  "ggplot2",
  "lubridate",
  "gtExtras",
  "gganimate",
  "gifski",
  "calendR",
  "janitor",
  "moments",
  "usmap",
  "magick",
  "broom"
)

install_if_missing <- function(pkg) {
  if (!requireNamespace(pkg, quietly = TRUE)) {
    install.packages(pkg, dependencies = TRUE)
  }
}

invisible(lapply(packages, install_if_missing))
message("All packages installed successfully.")
