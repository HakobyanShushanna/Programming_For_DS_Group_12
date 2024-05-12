library(ggplot2)
installed.packages("dplyr")
library(dplyr)

data <- read.csv("cleaned_final_dataset.csv")
data$lyric_length <- nchar(data$lyrics)

ggplot(data, aes(x = lyric_length)) +
  geom_density(fill = "skyblue", color = "blue") +
  labs(title = "Lyric Density Plot", x = "Lyric Length (Number of Characters)", y = "Density")


library(ggplot2)

ggplot(data, aes(x = energy))+
  geom_histogram(binwidth = 0.1, fill = "skyblue", color = "black") +
  labs(title = "Distribution of Energy Levels", x = "Energy", y = "Frequency") +
  theme_minimal()

library(dplyr)
library(ggplot2)

artist_counts <- data %>%
  group_by(artist) %>%
  summarise(num_songs = n()) %>%
  arrange(desc(num_songs))

top_artists <- head(artist_counts, 5)

data_top_artists <- data %>%
  filter(artist %in% top_artists$artist)

ggplot(data_top_artists, aes(x = energy, y = danceability)) +
  geom_point(alpha = 0.5, color = "blue") +  # Make dots more transparent and change color to blue
  facet_wrap(~ artist, nrow = 2) +
  labs(title = "Energy vs Danceability by Top Artists", 
       x = "Energy", y = "Danceability",
       caption = "Each facet represents an artist. Dots represent songs.") +
  theme_minimal()



