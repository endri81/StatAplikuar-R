# ============================================================
#  Java 11 -- download and prepare the data (run once, from week_11/)
#  Sources (all real):
#   - GADM 4.1, Albania level 1 (12 qarqe). Licence: free for academic and
#     non-commercial use; redistribution NOT allowed -> file is NOT in the repo.
#   - SRTM-based elevation, 30 arc-sec (geodata::elevation_30s), public domain.
#   - SRTM 90 m tile srtm_40_04 (CGIAR-CSI v4.1), cropped to Tirana-Durres-Dajti.
#   - WorldClim 2.1 monthly mean temperature, 30 arc-sec (CC BY 4.0).
#   - GPW v4 rev11 population density 2020, 2.5 arc-min (CIESIN, CC BY 4.0).
# ============================================================
library(terra)
library(geodata)

out <- "week_11_data"
raw <- file.path(out, "raw")                 # download cache (git-ignored)
dir.create(raw, showWarnings = FALSE, recursive = TRUE)

# GADM qarqe; add an ASCII name column (e-umlaut, c-cedilla removed)
q <- gadm("ALB", level = 1, path = raw)
asc <- function(x) {
  x <- gsub("ë", "e", x, fixed = TRUE, useBytes = TRUE); x <- gsub("Ë", "E", x, fixed = TRUE, useBytes = TRUE)
  x <- gsub("ç", "c", x, fixed = TRUE, useBytes = TRUE); x <- gsub("Ç", "C", x, fixed = TRUE, useBytes = TRUE)
  x
}
q$qark <- asc(q$NAME_1)
q <- q[, c("GID_1", "qark", "HASC_1", "NAME_1")]
writeVector(q, file.path(out, "gadm41_ALB_1.gpkg"), overwrite = TRUE)

# elevation 30 arc-sec, masked to Albania
e <- elevation_30s("ALB", path = raw)
writeRaster(e, file.path(out, "alb_elev_30s.tif"), overwrite = TRUE)

# SRTM 90 m, Tirana - Durres - Dajti window
s <- elevation_3s(lon = 19.8, lat = 41.3, path = raw)
s <- crop(s, ext(19.40, 19.98, 41.20, 41.48))
writeRaster(s, file.path(out, "srtm90_tirana.tif"), overwrite = TRUE, datatype = "INT2S")

# WorldClim monthly mean temperature (deg C)
w <- worldclim_country("ALB", "tavg", path = raw)
names(w) <- month.abb
writeRaster(w, file.path(out, "alb_tavg_30s.tif"), overwrite = TRUE)

# GPW v4 population density 2020 (persons / km2), cropped
p <- population(2020, 2.5, path = raw)
p <- crop(p, ext(18.9, 21.4, 39.4, 43))
writeRaster(p, file.path(out, "alb_gpw_dens_2020_2.5m.tif"), overwrite = TRUE)
