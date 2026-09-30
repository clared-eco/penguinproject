#getting everything organized
getwd()
install.packages("readr")
library(readr)
library(tidyverse)

#penguin project reading dataset into r
penguins <-read.table("penguin_data.txt", header = T)
glimpse(penguins)

#creating a linear regression for the penguins, model1 is the linear regression name
model1 <- lm(body_mass_g ~ flipper_length_mm, data = penguins)
summary(model1)

#creating a ggplot2
#aes = aesthetic properties of the data
ggplot(penguins, aes(x = flipper_length_mm, y = body_mass_g, colour = species)) +
  geom_point() +
  stat_smooth(method = "lm")

#saving the plot in my figs folder
ggsave("figs/1_flipper_bodymass_regressioon.png")

#subsetting the data to only look at female penguins
penguins_female <- subset(penguins, sex == "female")

#saving the edited dataset
write_tsv(penguins_female, "results/1_penguin_female_only.txt")


