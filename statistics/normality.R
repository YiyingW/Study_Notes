# test normality of data
# shapiro test
Shapiro_result <- data.frame(Analyte = character(), p_value = numeric())
data$Key <- factor(data$Key)
for (key in levels(data$Key)) {
  sub <- data[data$Key == key,]
  p_value <- NA
  try(p_value <- shapiro.test(sub$Value)[["p.value"]], silent=T)
  Shapiro_result <- Shapiro_result %>%
    rbind(data.frame(Analyte = key, p_value = p_value))
}

write.table(Shapiro_result, file = "Shapiro_test_class.txt", sep="\t", quote=F, row.names=F)
