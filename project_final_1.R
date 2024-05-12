data <- read.csv("cleaned_final_dataset.csv")

install.packages("plotly")
install.packages("dplyr")
library(plotly)
library(dplyr)

sampled_data_1 <- data %>%
  select(danceability) %>%
  sample_n(50, replace = FALSE)

sampled_data_2 <- data %>%
  select(energy) %>%
  sample_n(50, replace = FALSE)

sampled_data_3 <- data %>%
  select(valence) %>%
  sample_n(50, replace = FALSE)

plot_ly(data, x = ~sampled_data_1$danceability, y = ~sampled_data_2$energy, z = ~sampled_data_3$valence, 
        type = "scatter3d", mode = "markers",
        marker = list(size = 8, opacity = 0.8,
                      color = ~sampled_data_1$danceability, colors = c("#1f77b4", "#ff7f0e", "#2ca02c"),
                      line = list(color = "rgb(0,0,0)", width = 0.5))) %>%
  layout(scene = list(
    xaxis = list(title = "Danceability", titlefont = list(size = 12)),
    yaxis = list(title = "Energy", titlefont = list(size = 12)),
    zaxis = list(title = "Valence", titlefont = list(size = 12))
  ),
  title = "3D Scatterplot",
  margin = list(l = 0, r = 0, b = 0, t = 40),
  font = list(family = "Arial, sans-serif", size = 12),
  showlegend = FALSE)





library(ggplot2)
ggplot(data, aes(x = instrumentalness)) +
  geom_density(fill = "blue", alpha = 0.5) +  
  labs(x = "X Axis Label", y = "Instrumentalness", title = "Instrumentalness Plot") +  
  theme_minimal()+
  coord_cartesian(xlim = c(0, 0.01), ylim = c(0, 1000))

install.packages("wordcloud")
install.packages("tm")
install.packages("slam")
library(tm)
library(slam)
library(wordcloud)
wordcloud(words = data$lyrics, min.freq = 1, random.order = FALSE, colors = brewer.pal(8, "Dark2"))



install.packages("circlize")
library(circlize)
library(dplyr)
sampled_views <- data %>%
  select(views_x) %>%
  sample_n(10, replace = FALSE)
sampled_likes <- data %>%
  select(likes) %>%
  sample_n(10, replace = FALSE)
sampled_comments <- data %>%
  select(comments) %>%
  sample_n(10, replace = FALSE)

data_matrix <- with(data, table(sampled_views$views_x, sampled_likes$likes, sampled_comments$comments))
chordDiagram(data_matrix, transparency = 0.5)


