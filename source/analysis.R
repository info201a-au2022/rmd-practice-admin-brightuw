# A brief analysis of the NYT COVID-19 data

# Load the tidyverse package
library(tidyverse)

# Load the *national level* data into a variable. `national`
national <- read.csv("https://raw.githubusercontent.com/nytimes/covid-19-data/master/us.csv")

# This function returns total cases in the US
get_total_cases <- function() {
  total_cases <- national %>%
    filter(cases == max(cases)) %>%
    pull(cases)
  return(prettyNum(total_cases,big.mark=",",scientific=FALSE))
}

?prettyNum()

# This function returns the total number of cases in the US
get_total_deaths <- function() {
  total_deaths <- national %>%
    filter(deaths == max(deaths)) %>%
    pull(deaths)
  return(total_deaths)
}

# Run the following code to create a plot of cumulative cases over time
# (we'll explain the ggplot2 syntax next week)
cases_plot <- ggplot(data = national) +
  geom_line(mapping = aes(x = as.Date(date), y = cases)) +
  labs(x = "Date", y = "Cumulative Cases", title = "U.S. COVID Cases")
