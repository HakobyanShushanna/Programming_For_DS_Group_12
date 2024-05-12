library(ggplot2)

#Box Plot: Distribution of Loudness by Album Type 
ggplot(cleaned_final_dataset, aes(x = album_type, y = loudness, fill = album_type)) +
  geom_boxplot() +
  labs(title = "Distribution of Loudness by Album Type",
       x = "Album Type",
       y = "Loudness") +
  theme_minimal()

# Violin Plot: Distribution of Speechiness by Album Type
ggplot(cleaned_final_dataset, aes(x = album_type, y = speechiness, fill = album_type)) +
  geom_violin() +
  labs(title = "Distribution of Speechiness by Album Type",
       x = "Album Type",
       y = "Speechiness") +
  theme_minimal()

# Stacked Bar Plot: Distribution of Key by Album Type 
ggplot(cleaned_final_dataset, aes(x = album_type, fill = key)) +
  geom_bar(position = "stack") +
  labs(title = "Distribution of Key by Album Type",
       x = "Album Type",
       y = "Count") +
  theme_minimal()

ggplot(cleaned_final_dataset, aes(x = views_x, y = likes, size = comments)) +
  geom_point(color = "skyblue", alpha = 0.7) +
  scale_size_continuous(range = c(3, 10)) +  # Adjust the range of bubble sizes as needed
  labs(title = "Popular Songs Visualization",
       x = "Views",
       y = "Likes",
       size = "Comments") +
  theme_minimal()



ggplot(cleaned_final_dataset, aes(x = instrumentalness)) +
  geom_histogram(fill = "skyblue", color = "black", bins = 30) +
  labs(title = "Distribution of Instrumentalness in Songs",
       x = "Instrumentalness",
       y = "Frequency") +
  theme_minimal()


ggplot(cleaned_final_dataset, aes(x = duration_ms)) +
  geom_histogram(binwidth = 10000, fill = "skyblue", color = "black") +
  labs(title = "Distribution of Track Durations",
       x = "Duration (ms)",
       y = "Frequency") +
  theme_minimal()

ggplot(cleaned_final_dataset, aes(y = duration_ms)) +
  geom_boxplot(fill = "skyblue", color = "black") +
  labs(title = "Distribution of Track Durations",
       x = "",
       y = "Duration (ms)") +
  theme_minimal()
