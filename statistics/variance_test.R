# use function from R
# Bartlett's test: testing homogeneity of variances in k samples. For normally distributed data.
Bartlett_result <- data.frame(Analyte = character(), p_value = numeric())
data$Key <- factor(data$Key)
for (key in levels(data$Key)) {
  sub <- data[data$Key == key,]
  p_value <- NA
  try(p_value <- bartlett.test(Value~cond_1, sub)[["p.value"]], silent=T)
  Bartlett_result <- Bartlett_result %>%
    rbind(data.frame(Analyte = key, p_value = p_value))
}

write.table(Bartlett_result, file = "Bartlett_test_species.txt", sep="\t", quote=F, row.names=F)


# Levene's test: use when the data is not normally distributed
library(car)
Levene_result <- data.frame(Analyte = character(), p_value = numeric())
data$Key <- factor(data$Key)
data$cond_1 <- factor(data$cond_1)
for (key in levels(data$Key)) {
  sub <- data[data$Key == key,]
  p_value <- NA
  try(p_value <- leveneTest(Value~cond_1, sub)[["Pr(>F)"]], silent=T)
  Levene_result <- Levene_result %>%
    rbind(data.frame(Analyte = key, p_value = p_value))
}

write.table(Levene_result, file = "Levene_test_species.txt", sep="\t", quote=F, row.names=F)
