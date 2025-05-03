library(tidyverse)
library(readxl)
g1 <- read_excel("Goal1.xlsx")
colnames(g1)
g2 <- read_excel("Goal2.xlsx")
g3 <- read_excel("Goal3.xlsx")
g4 <- read_excel("Goal4.xlsx")
g5 <- read_excel("Goal5.xlsx")
g6 <- read_excel("Goal6.xlsx")
g7 <- read_excel("Goal7.xlsx")
g8 <- read_excel("Goal8.xlsx")
g9 <- read_excel("Goal9.xlsx")
g10 <- read_excel("Goal10.xlsx")
g11 <- read_excel("Goal11.xlsx")
g12 <- read_excel("Goal12.xlsx")
g13 <- read_excel("Goal13.xlsx")
g14 <- read_excel("Goal14.xlsx")
g15 <- read_excel("Goal15.xlsx")
g16 <- read_excel("Goal16.xlsx")
g17 <- read_excel("Goal17.xlsx")

colnames(g15)
colnames(g16)

g1m = g1 %>% 
  mutate(
    year_geoarea = paste(
      as.character(GeoAreaName), "-", as.character(TimePeriod)
    )
  )

g2m = g2 %>% 
  mutate(
    year_geoarea = paste(
      as.character(GeoAreaName), "-", as.character(TimePeriod)
    )
  )

g3m = g3 %>% 
  mutate(
    year_geoarea = paste(
      as.character(GeoAreaName), "-", as.character(TimePeriod)
    )
  )
    
g4m = g4 %>% 
  mutate(
    year_geoarea = paste(
      as.character(GeoAreaName), "-", as.character(TimePeriod)
    )
  )

g5m = g5 %>% 
  mutate(
    year_geoarea = paste(
      as.character(GeoAreaName), "-", as.character(TimePeriod)
    )
  )

g6m = g6 %>% 
  mutate(
    year_geoarea = paste(
      as.character(GeoAreaName), "-", as.character(TimePeriod)
    )
  )

g7m = g7 %>% 
  mutate(
    year_geoarea = paste(
      as.character(GeoAreaName), "-", as.character(TimePeriod)
    )
  )

g8m = g8 %>% 
  mutate(
    year_geoarea = paste(
      as.character(GeoAreaName), "-", as.character(TimePeriod)
    )
  )

g9m = g9 %>% 
  mutate(
    year_geoarea = paste(
      as.character(GeoAreaName), "-", as.character(TimePeriod)
    )
  )

g10m = g10 %>% 
  mutate(
    year_geoarea = paste(
      as.character(GeoAreaName), "-", as.character(TimePeriod)
    )
  )

g11m = g11 %>% 
  mutate(
    year_geoarea = paste(
      as.character(GeoAreaName), "-", as.character(TimePeriod)
    )
  )

g12m = g12 %>% 
  mutate(
    year_geoarea = paste(
      as.character(GeoAreaName), "-", as.character(TimePeriod)
    )
  )

g13m = g13 %>% 
  mutate(
    year_geoarea = paste(
      as.character(GeoAreaName), "-", as.character(TimePeriod)
    )
  )

g14m = g14 %>% 
  mutate(
    year_geoarea = paste(
      as.character(GeoAreaName), "-", as.character(TimePeriod)
    )
  )

g15m = g15 %>% 
  mutate(
    year_geoarea = paste(
      as.character(GeoAreaName), "-", as.character(TimePeriod)
    )
  )

g16m = g16 %>% 
  mutate(
    year_geoarea = paste(
      as.character(GeoAreaName), "-", as.character(TimePeriod)
    )
  )

g17m = g17 %>% 
  mutate(
    year_geoarea = paste(
      as.character(GeoAreaName), "-", as.character(TimePeriod)
    )
  )

#data <- merge(g1m, g2m, g3m, g4m, g5m, g6m, g7m, g8m, g9m, g10m, g11m, g12m, g13m, g14m, g15m, g16m, g17m, by = "year_geoarea")
#merged <- Reduce(function(x, y) merge(x, y, by = "year_geoarea"), 
                 #list(g1m, g2m, g5m, g6m, g13m))
#merged[complete.cases(merged), ]

merged <- merge(g1m, g2m, by = "year_geoarea", all.x = TRUE)
inner_merge <- merge(g1m, g2m, by = "year_geoarea")
head(inner_merge)

merged <- inner_join(g1m, g2m, by = "year_geoarea")
head(merged)
all_na_cols <- names(merged)[colSums(is.na(merged)) == nrow(merged)]
print(all_na_cols)


names(merged)
index <- c()
for (j in 1:length(all_na_cols)) {
  index <- c(index, which(names(merged) == all_na_cols[j]))
}
index

merged_no_na <- merged[, -index] 
merged2 <- merged %>% select(-all_na_cols)
dim(merged2)

dim(merged_no_na)
class(merged2[, 3])
head(merged2)

head(merged_no_na)

index2 <- c()
for (h in 1:36) {
  index2 <- c(index2, which(class(merged_no_na[, h]) == "numeric"))
  

}

merged2 %>% select(where(is.numeric)) %>% colnames()

index2
