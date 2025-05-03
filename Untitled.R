# load tables

# for each of the 5 tables we care about:
  # remove NA cols
  # compute the year-country combo index col
  # count uique values of that index col
  # rename. fields ex. 2018_2.1.1.
g1m <- g1m %>% select('Goal', 'Target', 'Indicator', 'SeriesCode', 'GeoAreaCode',
                      'GeoAreaName', 'TimePeriod', 'Value', 'Time_Detail',
                      'Sex', 'Location', 'Age') %>%
  rename(val_g1m = Value)


head(g2m)
g2m <- g2m %>% select('Goal', 'Target', 'Indicator', 'SeriesCode', 'GeoAreaCode',
                     'GeoAreaName', 'TimePeriod', 'Value', 'Time_Detail', 'Location') %>%
  rename(val_g2m = Value)
g5m
g6m
g13m
colnames(g2m)

na_g1m <- c()
for (j in 1:72) {
  if (all(is.na(unique(g1m[, j]))) == TRUE) {
    na_g1m <- c(na_g1m, j)
  }
}
na_g1m

na_g2m <- c()
for (j in 1:72) {
  if (all(is.na(unique(g2m[, j]))) == TRUE) {
    na_g2m <- c(na_g2m, j)
  }
}
na_g2m

na_g5m <- c()
for (j in 1:72) {
  if (all(is.na(unique(g5m[, j]))) == TRUE) {
    na_g5m <- c(na_g5m, j)
  }
}
na_g5m

na_g6m <- c()
for (j in 1:72) {
  if (all(is.na(unique(g6m[, j]))) == TRUE) {
    na_g6m <- c(na_g6m, j)
  }
}
na_g6m

na_g13m <- c()
for (j in 1:72) {
  if (all(is.na(unique(g13m[, j]))) == TRUE) {
    na_g13m <- c(na_g13m, j)
  }
}
na_g13m

g1m3 <- g1m %>% select(-na_g1m)

g1m3 <- g1m3 %>% select(-c(SeriesDescription, FootNote, `Reporting Type`, BasePeriod, Source))

g2m3 <- g2m %>% select(-na_g2m)
g2m3 <- g2m3 %>% select(-c(SeriesDescription, FootNote, `Reporting Type`, BasePeriod, Source))


g5m3 <- g5m %>% select(-na_g5m)
g5m3 <- g5m3 %>% select(-c(SeriesDescription, FootNote, `Reporting Type`, BasePeriod, Source))

g6m3 <- g6m %>% select(-na_g6m)
g6m3 <- g6m3 %>% select(-c(SeriesDescription, FootNote, `Reporting Type`, BasePeriod, Source))

g13m3 <- g13m %>% select(-na_g13m)
g13m3 <- g13m3 %>% select(-c(SeriesDescription, FootNote, `Reporting Type`, BasePeriod, Source))

saveRDS(g1m3, "g1m3.rds")
saveRDS(g2m3, "g2m3.rds")
saveRDS(g5m3, "g5m3.rds")
saveRDS(g6m3, "g6m3.rds")
saveRDS(g13m3, "g13m3.rds")
unique(g1m3$GeoAreaName)
m49codes <- c()
g1m3 <- g1m3 %>% dplyr::filter(Sex == "BOTHSEX", )


g1g2 <- inner_join(g1m3, g2m3, by = "year_geoarea", suffix = c(".g1", ".g2"))


# (left) joins
# start with the table w the most unique year-country pairs 