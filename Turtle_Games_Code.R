# Import the data
turtle_data <- read.csv("new_turtle_reviews.csv", header = TRUE)

# View the head of the data
head(turtle_data)

# Viewing the structure and summary of the data
str(turtle_data)
summary(turtle_data)

# Check for any missing values
sum(is.na(turtle_data))

# Exploratory data analysis using histograms and boxplots
columns_to_plot <- c("age", "loyalty_points", "remuneration", "spending_score")
for (col in columns_to_plot) {
  ggplot(turtle_data, aes_string(x = col)) +
    geom_histogram(binwidth = 10, fill = "blue", color = "black") +
    labs(title = paste("Histogram of", col), x = col, y = "Frequency") +
    theme_minimal() +
    print()
  
  ggplot(turtle_data, aes_string(y = col)) +
    geom_boxplot(fill = "orange") +
    labs(title = paste("Boxplot of", col), y = col) +
    theme_minimal() +
    print()
}

# Scatterplots to see relationships involving loyalty_points
relationships <- list(
  c("remuneration", "loyalty_points"),
  c("spending_score", "loyalty_points"),
  c("age", "loyalty_points")
)

for (pair in relationships) {
  ggplot(turtle_data, aes_string(x = pair[1], y = pair[2])) +
    geom_point() +
    geom_smooth(method = "lm", se = FALSE) +
    labs(title = paste(pair[2], "vs", pair[1]), x = pair[1], y = pair[2]) +
    theme_minimal() +
    print()
}

# Summary statistics for data
summary(turtle_data$age)
summary(turtle_data$remuneration)
summary(turtle_data$spending_score)
summary(turtle_data$loyalty_points)

# Determine if data is normally distributed for all columns
for (col in columns_to_plot) {
  cat("Normality check for:", col, "\n")
  
  # Q-Q plot
  qqnorm(turtle_data[[col]], main = paste("Q-Q plot of", col))
  qqline(turtle_data[[col]], col = 'red')
  
  # Shapiro-Wilk test
  shapiro_result <- shapiro.test(turtle_data[[col]])
  cat("Shapiro-Wilk p-value for", col, ":", shapiro_result$p.value, "\n")
  
  # Skewness and kurtosis
  cat("Skewness of", col, ":", skewness(turtle_data[[col]]), "\n")
  cat("Kurtosis of", col, ":", kurtosis(turtle_data[[col]]), "\n\n")
}

# Correlation analysis
cat("Correlation between loyalty_points and age:", cor(turtle_data$loyalty_points, turtle_data$age), "\n")
cat("Correlation between loyalty_points and remuneration:", cor(turtle_data$loyalty_points, turtle_data$remuneration), "\n")
cat("Correlation between loyalty_points and spending_score:", cor(turtle_data$loyalty_points, turtle_data$spending_score), "\n")

# Create the multiple linear regression model
model <- lm(loyalty_points ~ remuneration + spending_score + age, data = turtle_data)

# Summary of the model
summary(model)

# Diagnostic plots for the model
par(mfrow = c(2, 2))
plot(model)

# Calculate VIF for the model
vif_values <- vif(model)
print(vif_values)








