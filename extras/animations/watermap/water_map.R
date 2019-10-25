################################################################################
# Create bargraphs of water usage by sector type for each census block
# NOTE: This will create a whole bunch of plots and can take a second to run
################################################################################
library(dplyr)
library(leaflet)
library(ggplot2)
load("~/Documents/ids-data/current-data/dwp_2010.rda")

tmp <- dwp_2010 %>% group_by(census, sector_type) %>% summarize(total = total)
tmp1 <- reshape2::dcast(tmp, census ~ sector_type, fill = 0)
tmp2 <- reshape2::melt(tmp1, "census", c("Business", "Government", "Residential"), "sector")

for (i in unique(tmp2$census)) {
  # i = unique(tmp2$census)[length(unique(tmp2$census)) - 7]
  p <- tmp2 %>%
    filter(census == i) %>%
    ggplot() +
    geom_bar(aes(x = sector, y = value),
             stat = "identity",
             fill = c("#239400", "#7F2594", "black")) +
    labs(x = "Sector", y = "Water Used")
  # p
  file_name <- paste0("~/Dropbox/IDS Curriculum Design/Folder-James/Plots/Water Map Plots/", i, ".png")
  ggsave(filename = file_name,
         plot = p,
         width = 4,
         height = 2)
}

################################################################################
# Load the LA water data and make a map
################################################################################
p_data <- dwp_2010 %>%
  group_by(census) %>%
  dplyr::summarize(latitude = mean(latitude),
                   longitude = mean(longitude),
                   population = mean(census_pop),
                   total = sum(total))

p_data <- p_data %>% mutate(labels = paste0(
  "<b>Census block: </b>", census, "<br/>",
  "<b>Population: </b>", population, "<br/>",
  "<b>Total water used: </b>", total, "<br/>",
  "<img src='https://labs.idsucla.org/extras/animations/watermap/images/", census, ".png' height = 150 width = 250>"))


pal_total <- colorQuantile(palette = "RdBu",
                domain = p_data$total,
                n = 4)

leaflet(p_data) %>%
  # addTiles() %>%
  addProviderTiles("CartoDB.Positron") %>%
  addCircleMarkers(lng = ~longitude,
                   lat = ~latitude,
                   radius = 5,
                   color = ~pal_total(total),
                   popup = ~labels,
                   fillOpacity = 0.8,
                   stroke = FALSE,
                   group = "Base") %>%
  addCircleMarkers(lng = ~longitude,
                   lat = ~latitude,
                   radius = ~population/sum(population) * 5e3,
                   popup = ~labels,
                   color = ~pal_total(total),
                   fillOpacity = 0.8,
                   stroke = FALSE,
                   group = "Size by census_pop") %>%
  addLegend(pal = pal_total,
            values = ~total,
            position = "topright",
            opacity = 0.8,
            title = "LA Water Usage for<br/>2010 by Quartiles") %>%
  addLayersControl(baseGroups = c("Base", "Size by census_pop"),
                   position = "topright",
                   options = layersControlOptions(collapsed = FALSE))

################################################################################
# To save: Click "Export" in the Viewer pane in RStudio
################################################################################
