#### please fill out the survey (copy and paste into browser): 
## https://docs.google.com/forms/d/e/1FAIpQLScgr0ctppakmIjdMcj_VGtlzM9u5C-oRMXrgm0CCEPSfRlB2g/viewform?usp=sf_link

## Download csv and 

#load library
library(tidyverse)

#load data
example_r <- read_csv("pilarslides/data/example r.csv")

#what are the column names?
colnames(example_r)

#rename cols for ease 
colnames(example_r)[2:6] <- c("major", "masters", "animal", "r_before", "r_fun")

#looking at trends-- since we are all PhD students in poli sci, let's look at what undergrad major is most common?
table(example_r$major)

#what about frequencies of undergrad majors and having a masters degree? Any trends?
prop.table(table(example_r$major, example_r$masters))

#let's mutate character responses into numeric, then we can take the averages
example_r %>% 
  mutate(r_before = if_else(r_before == "Yes", 1, 0), 
         r_fun = if_else(r_fun == "Yes", 1, 0)) %>% 
  group_by(r_before) %>% 
  summarize(mean_r_fun = mean(r_fun))

#we can plot our favorite animals!
example_r %>% 
  ggplot(aes(x = animal, fill = animal)) +
  geom_bar()
