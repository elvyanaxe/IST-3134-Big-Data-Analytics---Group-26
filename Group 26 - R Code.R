# import libraries
library(readr)
library(dplyr)
library(tidyverse)
library(tidytext)

# read the CSV file
precovid_reviews <- read_csv("/Users/elvyanaee/Desktop/BDA Dataset/precovid_reviews.csv")

# select only 7 columns to keep
precovid_subset <- precovid_reviews %% select(name, city, stars, review_count, categories, text_, date_)

# sample a fraction of the dataset (85%, 70%, 60%, 55%, 50%, 30%, 20%, 10%)
set.seed(123)
precovid_85 <- postcovid_subset %>% sample_frac(0.85)
precovid_70 <- postcovid_subset %>% sample_frac(0.7)
precovid_60 <- postcovid_subset %>% sample_frac(0.6)
precovid_55 <- postcovid_subset %>% sample_frac(0.55)
precovid_50 <- postcovid_subset %>% sample_frac(0.5)
precovid_30 <- postcovid_subset %>% sample_frac(0.3)
precovid_20 <- postcovid_subset %>% sample_frac(0.2)
precovid_10 <- postcovid_subset %>% sample_frac(0.1)

# tokenize the text; the variable name is changed whenever analyzing a different subset
tidy_reviews <- precovid_50 %>%
  unnest_tokens(word, text_)

# calculate word count
word_freqs <- tidy_reviews %>%
  count(word, sort = TRUE)

