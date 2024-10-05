# Turtle Games Customer Analysis

## Overview
This project aims to analyse Turtle Games' customer data, including sales and customer reviews, to evaluate customer engagement with loyalty points, understand customer segmentation, and utilise customer feedback for improved marketing campaigns. By leveraging customer review data and segmentation strategies, Turtle Games intends to refine their marketing approach, enhance customer retention, and optimise sales performance.

## Business Background and Key Questions
**Turtle Games** is a global manufacturer and retailer of gaming products, offering a diverse range of gaming products. The company collects and analyses sales and customer review data to understand customer behaviour and improve business performance. This analysis aims to address the following key areas:

- **Customer Loyalty Points Analysis**: Determine factors influencing loyalty points, such as age, income, and spending habits, to optimise loyalty programs.
- **Customer Segmentation for Marketing**: Identify distinct customer groups through segmentation to tailor marketing campaigns effectively.
- **Customer Feedback Analysis**: Use Natural Language Processing (NLP) techniques to understand customer reviews and improve satisfaction.

## Data Cleaning and Preparation
### Steps Taken:
1. **Initial Data Exploration**
   - Imported the `turtle_reviews` dataset into Python for initial data cleaning and exploration.
   - Conducted descriptive statistics (`data.describe()`) and metadata analysis (`data.info()`) to understand the central tendencies, dispersion, and data distribution, ensuring reliability.

2. **Removing Unnecessary Columns**
   - Removed columns such as **"language"** and **"platform"** that were deemed unnecessary for the analysis to improve data clarity.

3. **Handling Missing Values**
   - Addressed missing values by appropriate imputation techniques to ensure data consistency and quality.

## Data Analysis Approach
### Tools and Libraries
This analysis was conducted using **Python** and **R**.

#### Libraries Used in Python
- **Pandas (`pd`)** and **NumPy (`np`)**: 
  - For data manipulation, numerical computations, and normalisation.

- **Matplotlib (`plt`)** and **Seaborn (`sns`)**: 
  - For data visualisations, including histograms, boxplots, scatterplots, and regression plots.

- **Scikit-Learn (`sklearn`)**:
  - **`LinearRegression`, `DecisionTreeRegressor`, `KMeans`**: For building regression models, decision trees, and clustering.
  - **`OneHotEncoder`, `train_test_split`**: For encoding categorical data and splitting datasets.
  - **`mean_squared_error, mean_absolute_error, r2_score, silhouette_score`**: To evaluate model performance.
  - **`CountVectorizer`**: For vectorising text data in NLP analysis.

- **Statsmodels (`sm`)**:
  - **`ols`**: For Ordinary Least Squares regression models.
  - **`variance_inflation_factor` (VIF)**: To assess multicollinearity.

- **Natural Language Processing**:
  - **NLTK**: For text tokenisation and stopword removal.
  - **TextBlob**: For sentiment analysis.
  - **WordCloud**: To create word frequency visualisations.

- **Other Tools**:
  - **`string`**: For text processing.
  - **`warnings`**: To suppress unnecessary warnings.

#### Libraries Used in R
- **ggplot2**:
  - For visualising data distributions through histograms, boxplots, and scatterplots.
  
- **dplyr**: 
  - For data wrangling and summarisation.

- **moments**:
  - To measure **skewness** and **kurtosis** of data distributions, helping assess whether the data is normally distributed or exhibits significant deviations.

- **car**:
  - For calculating the **Variance Inflation Factor (VIF)**, which helps detect multicollinearity in the multiple linear regression model.

- **stats** (Base R):
  - For conducting normality tests (`shapiro.test`), creating **Q-Q plots** (`qqnorm`, `qqline`), and building **linear regression models** (`lm`). Also used for **correlation** analysis (`cor`) between variables.

## Key Insights and Visualisation Summary

### Patterns, Trends, and Insights

1. **Spending Score Distribution**:
   - A histogram showed that a **spending score of 50** was the most frequent. The boxplot indicated a **lower quartile (Q1)** of **32**, a **median** of **50**, and an **upper quartile (Q3)** of **73**, showing moderate variability in spending scores.

   ![Histogram of Spending Score](Figure1.png)
   ![Boxplot of Spending Score](Figure2.png)

2. **Decision Tree Analysis**:
   - The decision tree model identified **spending score** as a primary driver influencing other variables like **remuneration** and **loyalty points**.

   ![Decision Tree](Figure3.png)

3. **Age and Remuneration Distributions**:
   - The age group **35-45** was most common, with **Q1 = 29**, **median = 38**, and **Q3 = 49**. For remuneration, the most frequent range was **35-45K**, with a **Q1** of **30.34K**, **median of 47.15K**, and **Q3 of 63.96K**.

   ![Histogram of Age](Figure5.png)
   ![Boxplot of Age](Figure4.png)
   ![Histogram of Remuneration](Figure6.png)
   ![Boxplot of Remuneration](Figure7.png)

4. **Customer Segmentation via K-Means Clustering**:
   - **K-means clustering (k = 5)** segmented customers based on spending and remuneration:
     - **Cluster 0** (774): Medium remuneration & spending score.
     - **Cluster 1** (269): Low remuneration & high spending score.
     - **Cluster 2** (356): High remuneration & spending score.
     - **Cluster 3** (271): Low remuneration & spending score.
     - **Cluster 4** (330): High remuneration & low spending score.

   These insights help target specific segments with tailored marketing strategies.

5. **Word Frequency in Reviews and Summaries**:
   - **NLP analysis** showed frequent terms like **"game"**, **"stars"**, **"fun"**, and **"great"**, highlighting aspects valued by customers.

   ![Word Clouds for Most Common Words in Reviews and Summaries](Figure8.png)

6. **Sentiment Analysis**:
   - Sentiment analysis indicated a generally **neutral to positive** tone, with most frequent values around **0.0** to **0.25**.

   ![Histogram of Sentiment Polarity](Figure9.png)

## Patterns and Predictions

### Key Findings on Loyalty Points

1. **Loyalty Points Analysis**:
   - Boxplot analysis showed **Q1 = 772**, **median = 1276**, and **Q3 = 1751**, with a right-skewed distribution and higher kurtosis, indicating extreme values.

   ![Boxplot of Loyalty Points](Figure10.png)

2. **Regression Analysis for Loyalty Points**:
   - **Age**: Minimal impact on loyalty points, with **R-squared = 0.0018** and a negative coefficient of **-4.0128**, suggesting an insignificant effect.
     
     ![Relationship between Age and Loyalty Points](Figure12.png)

   - **Remuneration**: Positive correlation, with **R-squared = 0.3795**, indicating that increased remuneration leads to approximately **34.19** more loyalty points per unit increase.

     ![Relationship between Remuneration and Loyalty Points](Figure13.png)

   - **Spending Score**: Positive correlation, with **R-squared = 0.4520**, predicting an increase of approximately **33.06** loyalty points per unit increase in spending score.

     ![Relationship between Spending Score and Loyalty Points](Figure14.png)

3. **Customer Retention Strategies**:
   - Encourage customers to increase loyalty points through higher **remuneration** or **spending score**, using targeted incentives to boost engagement.

## Recommendations

1. **Tailored Marketing Strategies**:
   - Implement **cluster-specific marketing** strategies based on segmentation results to optimise loyalty programs effectively.

2. **Enhance Product Messaging**:
   - Use insights from **customer feedback**, such as common words like "Game," "Great," and "Fun," to refine marketing campaigns that resonate with customer values.

3. **Drive Loyalty through Targeted Promotions**:
   - Offer personalised promotions to **high-potential customers** based on remuneration and spending score to increase loyalty points and drive engagement.

4. **Consideration of Data Distribution in Modelling**:
   - Given the non-normal distribution of loyalty points, consider alternative models or data transformations to enhance predictive accuracy.
