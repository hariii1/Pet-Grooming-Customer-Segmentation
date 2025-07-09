# 1. Install and Load Necessary Packages
install.packages("dplyr")
install.packages("tibble")
install.packages("ggplot2")
install.packages("stats")

library(dplyr)
library(tibble)
library(ggplot2)
library(stats)

# 2. Generate Artificial Pet Grooming Data
set.seed(123)

num_pets <- 300

grooming_data <- tibble(
  pet_id = 1:num_pets,
  pet_type = sample(c("Dog", "Cat" ,"rabbit"), num_pets, replace = TRUE, prob = c(0.85, 0.15 ,0.02)),
  grooming_frequency_months = sample(c(1, 2, 3, 6), num_pets, replace = TRUE, prob = c(0.2, 0.4, 0.3, 0.1)),
  avg_spend_per_visit = round(runif(num_pets, min = 40, max = 120), 2),
  total_visits = sample(1:25, num_pets, replace = TRUE, prob = c(rep(0.04, 10), rep(0.02, 15)))
)
head(grooming_data)
summary(grooming_data)

# 3. Prepare Data for K-Means Clustering
segmentation_vars <- grooming_data %>%
  select(grooming_frequency_months, avg_spend_per_visit, total_visits)

scaled_segmentation_data <- scale(segmentation_vars)

# 4. Apply K-Means Clustering
num_clusters <- 3
set.seed(42)

kmeans_result <- kmeans(scaled_segmentation_data, centers = num_clusters, nstart = 25)

grooming_data$cluster <- as.factor(kmeans_result$cluster)

view(grooming_data)

# 5. Visualize the Clusters
ggplot(grooming_data, aes(x = avg_spend_per_visit, y = total_visits, color = cluster)) +
  geom_point(alpha = 0.7, size = 3) +
  labs(title = paste("Pet Grooming Customer Segments (k =", num_clusters, ")"),
       x = "Average Spend Per Visit ($)",
       y = "Total Number of Visits") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5))

# 6. Summarize Cluster Characteristics for Interpretation
cluster_summary <- grooming_data %>%
  group_by(cluster) %>%
  summarise(
    Mean_Grooming_Freq_Months = mean(grooming_frequency_months),
    Mean_Spend_Per_Visit = mean(avg_spend_per_visit),
    Mean_Total_Visits = mean(total_visits),
    Number_of_Pets_in_Cluster = n()
  ) %>%
  arrange(cluster)
  view(cluster_summary)

print("--- Cluster Summary for Interpretation ---")
print(cluster_summary)
# --- Add this code after your existing ggplot scatter plot in Section A ---

# 8. Additional Visualizations: Bar Charts for Cluster Characteristics

# Bar chart for Average Grooming Frequency by Cluster
ggplot(cluster_summary, aes(x = cluster, y = Mean_Grooming_Freq_Months, fill = cluster)) +
  geom_bar(stat = "identity") +
  labs(title = "Average Grooming Frequency by Customer Segment",
       x = "Customer Segment",
       y = "Average Grooming Frequency (Months)") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5))

# Bar chart for Average Spend Per Visit by Cluster
ggplot(cluster_summary, aes(x = cluster, y = Mean_Spend_Per_Visit, fill = cluster)) +
  geom_bar(stat = "identity") +
  labs(title = "Average Spend Per Visit by Customer Segment",
       x = "Customer Segment",
       y = "Average Spend Per Visit ($)") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5))

# Bar chart for Average Total Visits by Cluster
ggplot(cluster_summary, aes(x = cluster, y = Mean_Total_Visits, fill = cluster)) +
  geom_bar(stat = "identity") +
  labs(title = "Average Total Visits by Customer Segment",
       x = "Customer Segment",
       y = "Average Total Visits") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5))