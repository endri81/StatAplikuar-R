# ============================================================
#  Java 12 -- data (run once, from week_12/)
#  meuse.csv, meuse_riv.csv, meuse_grid.csv: package sp (Burrough & McDonnell).
#  Albania rasters and qarqe: produced by ../week_11/week_11_data/get_data_week11.R
#  (GADM 4.1 may not be redistributed, so it is copied locally, not committed).
# ============================================================
data(meuse, package = "sp");      write.csv(meuse, "week_12_data/meuse.csv", row.names = FALSE)
data(meuse.grid, package = "sp"); write.csv(meuse.grid, "week_12_data/meuse_grid.csv", row.names = FALSE)
data(meuse.riv, package = "sp")
write.csv(data.frame(x = meuse.riv[, 1], y = meuse.riv[, 2]), "week_12_data/meuse_riv.csv",
          row.names = FALSE)
src <- "../week_11/week_11_data"
for (f in c("alb_tavg_30s.tif", "alb_elev_30s.tif", "gadm41_ALB_1.gpkg", "al_cities.csv"))
  file.copy(file.path(src, f), file.path("week_12_data", f), overwrite = TRUE)
